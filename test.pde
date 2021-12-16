import static java.util.concurrent.TimeUnit.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import g4p_controls.*;

PImage mudTerrain, grassTerrain, currentTerrain;  //Possible terrains
PFont font; 
boolean play = false;  // Determines if the simulation is paused or not
boolean isGrass = true; // Determines if the terrain is currently grassTerrain.
int alpha = 128;
int fireRateCount = 45;
int setRedTime = 30;
int redTimeUntilNextWave = setRedTime;
int setBlueTime = 30;
int blueTimeUntilNextWave = setBlueTime;

int redLInf = 0, redHInf = 0, redLCav = 0, redHCav = 0, redLArt = 0, redHArt = 0, redSniper = 0;
int blueLInf = 0, blueHInf = 0, blueLCav = 0, blueHCav = 0, blueLArt = 0, blueHArt = 0, blueSniper = 0;



color teamRed = color(255, 0, 0), teamBlue = color(0, 0, 255), linf = color(255, 255, 0), hinf = color(128, 128, 0),
      lcav = color(255, 0, 255), hcav = color(128, 0, 128), lart = color(0, 255, 255), hart = color(0, 128, 128),
      lrinf = color(241, 255, 175);

int redCasualties = 0;
int blueCasualties = 0;

int currentFrame = 0;

Sniper_Projectile one = new Sniper_Projectile(1.1, 252, 0, 0);
ArtilleryProjectile cannonShell = new ArtilleryProjectile(0, hart, 0, 0, 50);
SoldierSniper tester = new SoldierSniper("Red", lrinf, teamRed, one);
LightCavalrySoldier tester2 = new LightCavalrySoldier("Blue", linf, teamBlue, 800, 200);
Soldier tester3 = new Soldier("Artillery", "Blue", hart, teamBlue, 1000, cannonShell, 10, 400, 400);

//Armies//
Army blue = new Army("Blue Army", teamBlue);
Army red = new Army("Red Army", teamRed);

void setup() {
  size(1000, 1000);
  createGUI();
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  currentTerrain = grassTerrain;
  image(currentTerrain, 0, 0);
  
  //Army Waves//
  blue.addWave(blueLInf, blueHInf, blueLCav, blueHCav, blueLArt, blueHArt, blueSniper, 100);
  for(Soldier s : blue.soldiers) {
    s.display();
  }

  red.addWave(redLInf, redHInf, redLCav, redHCav, redLArt, redHArt, redSniper, 100);
  for(Soldier s : red.soldiers) {
    s.display();
  }
  font = createFont("SegoeUI-Bold-25.vlw", 25);
}

void draw() {
  
  image(currentTerrain, 0, 0);
  red.checkDeaths2();
  blue.checkDeaths2();

  //Displays Soldiers//
  for(Soldier s : blue.soldiers) {
    s.display();
  }
  for(Soldier s : red.soldiers) {
    s.display();
  }

  //Determines Individual Soldier Target//
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
      s.pathfind(s.target);
    }
    else {
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
    if(!(s.target == null)) {
      s.pathfind(s.target);
    }
    else {
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

  redTimeUntilNextWave--;
  blueTimeUntilNextWave--;
  if(redTimeUntilNextWave == 0) {
    redTimeUntilNextWave = setRedTime;
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

void keyPressed() {  //Detects if the r button was pressed so that it can pause or unpause simulation
  if(key == 'r') {
    if(play) {
      loop();
      play = false;
    }
    else {
      noLoop();
      play = true;
    }
  }
}
