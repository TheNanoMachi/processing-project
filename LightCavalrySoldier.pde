class LightCavalrySoldier extends Soldier {
    LightCavalrySoldier(String team, color typeC, color teamC) {
        super("Light Cavalry", team, typeC, teamC, 500, 2, 0, 0);
    }
    LightCavalrySoldier(String team, color typeC, color teamC, float x, float y) {
        super("Light Cavalry", team, typeC, teamC, 500, null, 2, x, y);
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
                    s.vitality -= 5;
                }
            }
        }
        else {
            for(Soldier s : blue.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 40) {
                    s.vitality -= 5;
                }
            }
        }
    }

    
}