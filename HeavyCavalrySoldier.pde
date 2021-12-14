class HeavyCavalrySoldier extends Soldier {
    HeavyCavalrySoldier(String team, color typeC, color teamC, float x, float y) {
        super("Heavy Cavalry", team, typeC, teamC, 600, null, 1.5, x, y);
        this.vitality = 20;
    }

    @Override
    void attack() {
        this.deathCheck();
        if(this.target == null) {
            return;
        }
        fill(0, 0, 0, 0);
        stroke(this.teamColour);
        strokeWeight(5);
        circle(this.x, this.y, 40);
        if(this.teamColour == teamBlue) {
            for(Soldier s : red.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 40) {
                    s.vitality -= 10;
                }
            }
        }
        else {
            for(Soldier s : blue.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 40) {
                    s.vitality -= 10;
                }
            }
        }
    }
}