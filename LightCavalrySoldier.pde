class LightCavalrySoldier extends Soldier {
    LightCavalrySoldier(String team, color typeC, color teamC) {
        super("Light Cavalry", team, typeC, teamC, 50, 2, 0, 0);
        this.vitality = 10;
        this.damage = 15;
        this.damageMin = -2;
        this.damageMax = 2;
    }
    LightCavalrySoldier(String team, color typeC, color teamC, float x, float y) {
        super("Light Cavalry", team, typeC, teamC, 50, null, 2, x, y);
        this.vitality = 10;
        this.damage = 10;
        this.damageMin = -2;
        this.damageMax = 2;
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
        // Draw the targeting circle (40 pixels). Cosmetic circle used to clarify attacking range.
        circle(this.x, this.y, 40);
        // checks for current team and attacks opposite team units
        if(this.teamColour == teamBlue) {
            for(Soldier s : red.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 40) {
                    s.takeDamage(this);
                }
            }
        }
        else {
            for(Soldier s : blue.soldiers) {
                if(dist(this.x, this.y, s.x, s.y) <= 40) {
                    s.takeDamage(this);
                }
            }
        }
    }

    
}