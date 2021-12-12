import java.util.ConcurrentModificationException;
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

  void addWave(int compLInf, int compHInf, int compLCav, int compHCav, int compLArt, int compHArt, int compLRInf, int spawnX) {
    int spawnY = 500;
    for(int i = 0; i < compLInf; i++) {
      // TODO: Make spawing zones, add different projectiles
      LightInfantrySoldier temp = new LightInfantrySoldier("Blue", linf, team, one, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compHInf; i++) {
      HeavyInfantrySoldier temp = new HeavyInfantrySoldier("Blue", hinf, team, one, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compLCav; i++) {
      LightCavalrySoldier temp = new LightCavalrySoldier("Blue", lcav, team, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compHCav; i++) {
      HeavyCavalrySoldier temp = new HeavyCavalrySoldier("Blue", hcav, team, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compHArt; i++) {
      HeavyArtillerySoldier temp = new HeavyArtillerySoldier("Blue", hart, team, cannonShell, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compLArt; i++) {
      LightArtillerySoldier temp = new LightArtillerySoldier("Blue", lart, team, cannonShell, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
    for(int i = 0; i < compLRInf; i++) {
      SoldierSniper temp = new SoldierSniper("Blue", lrinf, team, one, spawnX, spawnY);
      spawnY += 20;
      this.soldiers.add(temp);
    }
  }

  void checkDeaths() {
    this.soldiers.removeIf(s -> !s.alive);
  }
}
