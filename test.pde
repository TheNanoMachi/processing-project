PImage mudTerrain, grassTerrain;
int alpha = 128;
color teamRed = color(255, 0, 0), teamBlue = color(0, 0, 255), linf = color(255, 255, 0), hinf = color(128, 128, 0),
      lcav = color(255, 0, 255), hcav = color(128, 0, 128), lart = color(0, 255, 255), hart = color(0, 128, 128),
      lrinf = color(0, 255, 0);
Sniper_Projectile one = new Sniper_Projectile(1.1, 252, 0, 0);
SoldierSniper tester = new SoldierSniper("Red", lrinf, teamRed, one);
SoldierSniper tester2 = new SoldierSniper("Blue", lrinf, teamRed, one, 200, 200);

void setup() {
  size(1000, 1000);
  mudTerrain = loadImage("muddy.png");
  grassTerrain = loadImage("grassy.png");
  image(grassTerrain, 0, 0);
  
  tester.display();
  tester2.display();
}

void draw() {
    image(grassTerrain, 0, 0);
    tester.display();
    tester2.display();
    tester.pathfind(tester2);
    one.shoot(tester);
}
