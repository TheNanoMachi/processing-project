class Army {
  ArrayList<Soldier> soldiers;
  String name;
  color team;
  int casualties;
  int soldierAmount;

  Army(String name, color team) {
   this.name = name;
   this.team = team;
   this.casualties = 0;
   this.soldiers = new ArrayList<Soldier>();
   this.soldierAmount = 0;
  }

  void spawnWave(int compLInf, int compHInf, int compLCav, int compHCav, int compLArt, int compHArt, int compLRInf) {
    for(int i = 0; i < compLInf, i++) {
      // TODO: Replace these with actual soldier subclasses.
      Soldier temp = new Soldier("Light Infantry", "Blue", linf, team, 1000, 10, 400, 400);
      this.soldiers.add();
    }
    for(int i = 0; i < compHInf, i++) {
      
    }
    for(int i = 0; i < compLCav, i++) {
      
    }
    for(int i = 0; i < compHCav, i++) {
      
    }
    for(int i = 0; i < compHArt, i++) {
      
    }
    for(int i = 0; i < compLArt, i++) {
      
    }
    for(int i = 0; i < compLRInf, i++) {
      
    }
  }
}
