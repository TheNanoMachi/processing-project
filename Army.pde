class Army {
  ArrayList<Soldier> soldiers;
  String name;
  color team;
  int casualties;
  int soldierAmount;
  float gap;

  Army(String name, color team) {
    this.name = name;
    this.team = team;
    this.casualties = 0;
    this.soldiers = new ArrayList<Soldier>();
    this.soldierAmount = 0;
    // gap between each soldier
    this.gap = 40;
  }

  //Creates Army Waves//
  void addWave(int compLInf, int compHInf, int compLCav, int compHCav, int compLArt, int compHArt, int compLRInf, int spawnX) {
    // the initial y-coordinate for spawning is 70, or right underneath the casualty counter.
    // This is so big waves have more space to be spawned.
    int spawnY = 70;
    // Add gap (of 40) per each unit.
    for (int i = 0; i < compLInf; i++) {
      LightInfantrySoldier temp = new LightInfantrySoldier("Blue", linf, team, one, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
    // reset for next group
    spawnY = 75;
    for (int i = 0; i < compHInf; i++) {
      HeavyInfantrySoldier temp = new HeavyInfantrySoldier("Blue", hinf, team, one, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }

    // and so on
    spawnY = 90;
    for (int i = 0; i < compLCav; i++) {
      LightCavalrySoldier temp = new LightCavalrySoldier("Blue", lcav, team, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
    spawnY = 105;
    for (int i = 0; i < compHCav; i++) {
      HeavyCavalrySoldier temp = new HeavyCavalrySoldier("Blue", hcav, team, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
    spawnY = 120;
    for (int i = 0; i < compHArt; i++) {
      HeavyArtillerySoldier temp = new HeavyArtillerySoldier("Blue", hart, team, cannonShell, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
    spawnY = 135;
    for (int i = 0; i < compLArt; i++) {
      LightArtillerySoldier temp = new LightArtillerySoldier("Blue", lart, team, cannonShell, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
    spawnY = 150;
    for (int i = 0; i < compLRInf; i++) {
      SoldierSniper temp = new SoldierSniper("Blue", lrinf, team, one, spawnX, spawnY);
      spawnY += this.gap;
      this.soldiers.add(temp);
    }
  }

  void checkDeaths2() {  //Checks each soldier if they are dead and removes dead soldiers
  // This used to be done in one line with removeIf
  // but since processing 3.5 doesn't support lambda functions
  // this is used instead
    ArrayList<Soldier> temp = new ArrayList<Soldier>();
    // copy alive soldiers to new arraylist
    for (Soldier s : this.soldiers) {
      if (s.alive) {
        temp.add(s);
      }
    }
    // replace soldiers with temporary arraylist
    // thereby removing dead soldiers
    this.soldiers = temp;
  }

  void cullSoldiers() {
    // remove soldiers that are too far away
    for (Soldier s : this.soldiers) {
      if (s.x <= 0 || s.x >= 1000 || s.y <= 0 || s.y >= 1000) {
        s.die();
      }
    }
  }
}
