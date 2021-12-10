class LightArtillerySoldier extends Soldier {
    LightArtillerySoldier(String team, color typeC, color teamC, Projectile artProj, float x, float y) {
        super("Light Artillery", team, typeC, teamC, 600, artProj, 4, x, y);
    }
}