class LightCavalrySoldier extends Soldier {
    LightCavalrySoldier(String team, color typeC, color teamC, Projectile cavProj) {
        super("Light Cavalry", team, typeC, teamC, 500, cavProj, 5);
    }
    LightCavalrySoldier(String team, color typeC, color teamC, Projectile cavProj, float x, float y) {
        super("Light Cavalry", team, typeC, teamC, 500, cavProj, 5, x, y);
    }
}