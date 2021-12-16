class HeavyCavalrySoldier extends Soldier {
    HeavyCavalrySoldier(String team, color typeC, color teamC, float x, float y) {
        super("Heavy Cavalry", team, typeC, teamC, 50, null, 1.5, x, y);
        this.vitality = 15;
        this.damage = 20;
        this.damageMin = -5;
        this.damageMax = 5;
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