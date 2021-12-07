class LightCavalrySoldier extends Soldier {
    LightCavalrySoldier(String team, color typeC, color teamC, Projectile cavProj) {
        super("Light Cavalry", team, typeC, teamC, 500, cavProj, 10);
    }
    LightCavalrySoldier(String team, color typeC, color teamC, Projectile cavProj, float x, float y) {
        super("Light Cavalry", team, typeC, teamC, 500, cavProj, 10, x, y);
    }

    @Override
    void attack() {
        fill(0, 0, 0, 0);
        stroke(this.teamColour);
        strokeWeight(5);
        circle(this.x, this.y, 30);
    }
}