class SoldierSniper extends Soldier {

    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5);
    }
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj, float x, float y) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5, x, y);
    }

    @Override
    void pathfind(Soldier s) {

    }
}