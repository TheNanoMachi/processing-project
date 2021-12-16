class HeavyInfantrySoldier extends Soldier {
    HeavyInfantrySoldier(String team, color typeC, color teamC, Projectile infProj, float x, float y) {
        super("Heavy Infantry", team, typeC, teamC, 100, infProj, 1, x, y);
        this.vitality = 20;
        this.damage = 17;
        this.damageMin = -3;
        this.damageMax = 3;
    }

    @Override
    // Attack function for melee units
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