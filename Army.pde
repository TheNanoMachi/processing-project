class Army {
  ArrayList<Soldier> Soldiers;
  String name;
  int casualties;

  Army(String name, int casualties) {
   this.name = name;
   this.casualties = casualties;
   this.Soldiers = new ArrayList<Soldier>();
  }
}
