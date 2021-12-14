PImage mudTerrain, grassTerrain;
boolean play = false;
int alpha = 128;
int fireRateCount = 45;
int timeUntilNextWave = 120;
color teamRed = color(255, 0, 0), teamBlue = color(0, 0, 255), linf = color(255, 255, 0), hinf = color(128, 128, 0),
      lcav = color(255, 0, 255), hcav = color(128, 0, 128), lart = color(0, 255, 255), hart = color(0, 128, 128),
      lrinf = color(128);
Sniper_Projectile one = new Sniper_Projectile(1.1, 252, 0, 0);
ArtilleryProjectile cannonShell = new ArtilleryProjectile(0, hart, 0, 0, 50);
SoldierSniper tester = new SoldierSniper("Red", lrinf, teamRed, one);
LightCavalrySoldier tester2 = new LightCavalrySoldier("Blue", linf, teamBlue, 800, 200);
Soldier tester3 = new Soldier("Artillery", "Blue", hart, teamBlue, 1000, cannonShell, 10, 400, 400);

Army blue = new Army("Blue Army", teamBlue);
Army red = new Army("Red Army", teamRed);
void setup() {
  size(1000, 1000);
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  image(grassTerrain, 0, 0);
  
  // tester.display();
  // tester2.display();
  // tester3.display();

  blue.addWave(6, 6, 6, 6, 6, 6, 6, 200);
  for(Soldier s : blue.soldiers) {
    s.display();
  }

  red.addWave(6, 6, 6, 6, 6, 6, 6, 800);
  for(Soldier s : red.soldiers) {
    s.display();
  }
}

void draw() {
  // TODO: fix "rubberbanding" visual bug
  image(grassTerrain, 0, 0);
  println("red", red.soldiers.size(), "blue", blue.soldiers.size());
  red.checkDeaths2();
  blue.checkDeaths2();
  // tester.pathfind(tester2);
  // tester2.pathfind(tester);
  // tester3.pathfind(tester);
  for(Soldier s : blue.soldiers) {
    for(Soldier s1 : red.soldiers) {
      if(dist(s.x, s.y, s1.x, s1.y) <= s.sight) {
        s.target = s1;
        break;
      }
    }
    if(!(s.target == null))
      s.pathfind(s.target);
  }
  for(Soldier s : red.soldiers) {
    for(Soldier s1 : blue.soldiers) {
      if(dist(s.x, s.y, s1.x, s1.y) <= s.sight) {
        s.target = s1;
        break;
      }
    }
    if(!(s.target == null))
      s.pathfind(s.target);
  }
  // if(tester.alive) {
  //   if(tester.attacked) {
  //     fireRateCount--;
  //     if(fireRateCount == 0) {
  //       // TODO: have the projectile actually travel.
  //       if(one.gone) {
  //         one.resetShotFlag = true;
  //       }
  //       tester.attack(tester2);
  //       fireRateCount = 45;
  //     }
  //   }
  // }
  if(red.soldiers.size() <= 12) {
    red.addWave(5, 5, 5, 5, 5, 5, 5, 800);
  }
  if(blue.soldiers.size() <= 12) {
    blue.addWave(5, 5, 5, 5, 5, 5, 5, 200);
  }

  timeUntilNextWave--;
  if(timeUntilNextWave == 0) {
    blue.addWave(30, 30, 30, 30, 30, 30, 30, 200);
    red.addWave(30, 30, 30, 30, 30, 30, 30, 800);
    timeUntilNextWave = 120;
  }

  red.cullSoldiers();
  blue.cullSoldiers();
  //one.shoot(tester);
}

void keyPressed() {
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
