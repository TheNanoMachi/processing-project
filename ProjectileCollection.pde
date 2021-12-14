class ProjectileCollection {
    ArrayList<Projectile> projectiles;

    ProjectileCollection() {
        this.projectiles = new ArrayList<Projectile>();
    }

    void cullProjectile() {
        // Simple implementation using the removeIf function.
        // May not work on Processing 3.5.
        this.projectiles.removeIf(p -> p.gone);
    }

    void cullProjectile2() {
        // If the original cullProjectile() function doesn't work
        // it's probably because of the lambda function which doesn't seem
        // to be supported in Processing 3.5. This implementation is probably
        // less efficient and definitely longer, but
        // it works in Processing 3.5.

        ArrayList<Projectile> temp = new ArrayList<Projectile>();
        for(Projectile p : this.projectiles) {
            if(!p.gone) {
                temp.add(p);
            }
        }
        this.projectiles = temp;
    }

    void addProjectiles(Army army) {
        for(Soldier s : army) {
            if(s.type.contains("Artillery")) {
               s.projectile = new ArtilleryProjectile(0, color(0, 255, 255), this.x, this.y, 50);
               this.projectiles.add(s.projectile);
            }
            else if(s.type.contains("Sniper")) {
                s.projectile = new Sniper_Projectile(0, color(255), this.x, this.y);
                this.projectiles.add(s.projectile);
            }
        }
    }
}