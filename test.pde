// import some libraries to do timing
import static java.util.concurrent.TimeUnit.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
// also import g4p GUI library
import g4p_controls.*;

PImage mudTerrain, grassTerrain, currentTerrain;  //Possible terrains
boolean play = false;  // Determines if the simulation is paused or not
boolean isGrass = true; // Determines if the terrain is currently grassTerrain.

int setRedTime = 30; // multiple of 30 since draw() is 30 fps.
int redTimeUntilNextWave = setRedTime;
int setBlueTime = 30; // same here
int blueTimeUntilNextWave = setBlueTime;

// by default no troops are on screen
int redLInf = 0, redHInf = 0, redLCav = 0, redHCav = 0, redLArt = 0, redHArt = 0, redSniper = 0;
int blueLInf = 0, blueHInf = 0, blueLCav = 0, blueHCav = 0, blueLArt = 0, blueHArt = 0, blueSniper = 0;

// set up colouring scheme
color teamRed = color(255, 0, 0), teamBlue = color(0, 0, 255), linf = color(255, 255, 0), hinf = color(128, 128, 0),
      lcav = color(255, 0, 255), hcav = color(128, 0, 128), lart = color(0, 255, 255), hart = color(0, 128, 128),
      lrinf = color(241, 255, 175);

// initially casualties are at 0
int redCasualties = 0;
int blueCasualties = 0;

// these are actually placeholder projectiles that are used when soldiers are created.
Sniper_Projectile one = new Sniper_Projectile(1.1, 252, 0, 0);
ArtilleryProjectile cannonShell = new ArtilleryProjectile(0, hart, 0, 0, 50);

// Armies
Army blue = new Army("Blue Army", teamBlue);
Army red = new Army("Red Army", teamRed);

void setup() {
  size(1000, 1000);
  createGUI();
  // Set terrain images.
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  currentTerrain = grassTerrain;
  image(currentTerrain, 0, 0);
  
  // add army waves
  blue.addWave(blueLInf, blueHInf, blueLCav, blueHCav, blueLArt, blueHArt, blueSniper, 100);
  for(Soldier s : blue.soldiers) {
    s.display();
  }
  
  red.addWave(redLInf, redHInf, redLCav, redHCav, redLArt, redHArt, redSniper, 100);
  for(Soldier s : red.soldiers) {
    s.display();
  }
}

void draw() {
  image(currentTerrain, 0, 0);
  // Check deaths on either side
  red.checkDeaths2();
  blue.checkDeaths2();

  // Displays Soldiers
  for(Soldier s : blue.soldiers) {
    s.display();
  }
  for(Soldier s : red.soldiers) {
    s.display();
  }

  // Determines Individual Soldier Target
  for(Soldier s : blue.soldiers) {
    for(Soldier s1 : red.soldiers) {
      if(dist(s.x, s.y, s1.x, s1.y) <= s.sight) {
        s.target = s1;
        break;
      }
    }
    // (for both teams) pathfinds to target if there is one, or move towards the other camp's
    // general direction.
    if(!(s.target == null)) {
      // pathfind to them if a target is found
      s.pathfind(s.target);
    }
    else {
      // else move towards the opposing team
      s.move(s.speed, 0);
    }
      
  }

  // Sets targets for the red soldiers.
  for(Soldier s : red.soldiers) {
    for(Soldier s1 : blue.soldiers) {
      if(dist(s.x, s.y, s1.x, s1.y) <= s.sight) {
        s.target = s1;
        break;
      }
    }
    // pathfind to them if a target is found
    if(!(s.target == null)) {
      s.pathfind(s.target);
    }
    else {
      // else move towards the opposing team
      s.move(-s.speed, 0);
    }
  }
  
  // Spawns a reinforcement wave if the amount of soldiers on each side is too low.
  if(red.soldiers.size() <= 12) {
    red.addWave(redLInf, redHInf, redLCav, redHCav, redLArt, redHArt, redSniper, 900);
  }
  if(blue.soldiers.size() <= 12) {
    blue.addWave(blueLInf, blueHInf, blueLCav, blueHCav, blueLArt, blueHArt, blueSniper, 100);
  }

  // count down the time until the next wave
  redTimeUntilNextWave--;
  blueTimeUntilNextWave--;

  if(redTimeUntilNextWave == 0) {
    // reset the timer
    redTimeUntilNextWave = setRedTime;
    // if there aren't too many soldiers on screen already
    // spawn the next wave
    if(red.soldiers.size() <= 50) {
      red.addWave(redLInf, redHInf, redLCav, redHCav, redLArt, redHArt, redSniper, 900);
    }
  }
  
  if(blueTimeUntilNextWave == 0) {
    blueTimeUntilNextWave = setBlueTime;
    if(blue.soldiers.size() <= 50) {
      blue.addWave(blueLInf, blueHInf, blueLCav, blueHCav, blueLArt, blueHArt, blueSniper, 100);
    }
  }
    
  // Remove soldiers that are out of bounds.
  red.cullSoldiers();
  blue.cullSoldiers();

  // Set some colours and draw a rectangle
  // as background for the casualty counter
  fill(0);
  stroke(0);
  rect(740, 10, 245, 50);

  fill(0);
  stroke(0);
  rect(10, 10, 245, 50);

  fill(255,0,0);
  textSize(25);
  text("Red Casualties: " + redCasualties, 750, 40);

  fill(0,0,255);
  textSize(25);
  text("Blue Casualties: " + blueCasualties, 20, 40);
}
