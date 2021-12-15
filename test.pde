import static java.util.concurrent.TimeUnit.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;

PImage mudTerrain, grassTerrain;  //Possible terrains
PFont font; 
boolean play = false;  //Determines if the simulation is paused or not
int alpha = 128;
int fireRateCount = 45;
int timeUntilNextWave = 120;  //Time for both sides to spawn the next wave
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
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  image(grassTerrain, 0, 0);
  
  //Army Waves//
  blue.addWave(6, 6, 6, 6, 6, 6, 6, 100);
  //blue.addWave(0, 0, 0, 0, 6, 0, 6, 100);
  for(Soldier s : blue.soldiers) {
    s.display();
  }



  red.addWave(6, 6, 6, 6, 6, 6, 6, 900);
  //red.addWave(0, 0, 0, 0, 6, 0, 6, 900);
  for(Soldier s : red.soldiers) {
    s.display();
  }
  font = createFont("SegoeUI-Bold-25.vlw", 25);
}

void draw() {
  
  image(grassTerrain, 0, 0);
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
    red.addWave(5, 5, 5, 5, 5, 5, 5, 900);
  }
  if(blue.soldiers.size() <= 12) {
    blue.addWave(5, 5, 5, 5, 5, 5, 5, 100);
  }

  timeUntilNextWave--;
  // Tries to spawn a wave every 4 seconds (at 30 fps), but won't spawn a wave if there are
  // more than 70 soldiers on screen.
  if(timeUntilNextWave == 0) {
    if(blue.soldiers.size() <= 35) {
      blue.addWave(5, 5, 5, 5, 5, 5, 5, 100);
    }
    if(red.soldiers.size() <= 35) {
      red.addWave(5, 5, 5, 5, 5, 5, 5, 900);
    }
      
    timeUntilNextWave = 120;
    currentFrame++;
  }


  // Remove soldiers that are out of bounds.
  red.cullSoldiers();
  blue.cullSoldiers();

  fill(255,0,0);
  textSize(25);
  
  textFont(font);
  text("Red Casualties: " + redCasualties, 750, 40);

  fill(0,0,255);
  textSize(25);
  textFont(font);
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
