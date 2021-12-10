class HeavyArtillerySoldier extends Soldier {
    HeavyArtillerySoldier(String team, color typeC, color teamC, Projectile artProj, float x, float y) {
        // String type, String team, color typeC,
        // color teamC, int sight, Projectile proj, float speed, float x, float y
        super("Heavy Artillery", team, typeC, teamC, 600, artProj, 1, x, y);
    }
}