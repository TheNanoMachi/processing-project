PImage mudTerrain, grassTerrain;
int alpha = 128;
int fireRateCount = 45;
color teamRed = color(255, 0, 0), teamBlue = color(0, 0, 255), linf = color(255, 255, 0), hinf = color(128, 128, 0),
      lcav = color(255, 0, 255), hcav = color(128, 0, 128), lart = color(0, 255, 255), hart = color(0, 128, 128),
      lrinf = color(0, 255, 0);
Sniper_Projectile one = new Sniper_Projectile(1.1, 252, 0, 0);
ArtilleryProjectile cannonShell = new ArtilleryProjectile(0, hart, 0, 0, 50);
SoldierSniper tester = new SoldierSniper("Red", lrinf, teamRed, one);
LightCavalrySoldier tester2 = new LightCavalrySoldier("Blue", linf, teamBlue, 800, 200);
Soldier tester3 = new Soldier("Artillery", "Blue", hart, teamBlue, 1000, cannonShell, 10, 400, 400);

Army blue = new Army("Blue Army", teamBlue);

void setup() {
  size(1000, 1000);
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  image(grassTerrain, 0, 0);
  
  tester.display();
  tester2.display();
  tester3.display();

}

void draw() {
    image(grassTerrain, 0, 0);
    tester.pathfind(tester2);
    tester2.pathfind(tester);
    tester3.pathfind(tester);
    if(tester.attacked) {
      fireRateCount--;
      if(fireRateCount == 0) {
        // TODO: have the projectile actually travel.
        if(one.gone) {
          one.resetShotFlag = true;
        }
        tester.attack(tester2);
        fireRateCount = 45;
      }
    }
    
    //one.shoot(tester);
}
