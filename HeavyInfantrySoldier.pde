class HeavyInfantrySoldier extends Soldier {
    HeavyInfantrySoldier(String team, color typeC, color teamC, Projectile infProj, float x, float y) {
        super("Heavy Infantry", team, typeC, teamC, 600, infProj, 2, x, y);
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