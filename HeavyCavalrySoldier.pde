class HeavyCavalrySoldier extends Soldier {
    HeavyCavalrySoldier(String team, color typeC, color teamC, float x, float y) {
        super("Heavy Cavalry", team, typeC, teamC, 600, null, 3, x, y);
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
        circle(this.x, this.y, 30);
        if(this.teamColour == teamBlue) {
            for(Soldier s : red.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 30) {
                    s.die();
                }
            }
        }
        else {
            for(Soldier s : blue.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 30) {
                    s.die();
                }
            }
        }
    }
}