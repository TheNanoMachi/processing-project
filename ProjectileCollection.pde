class ProjectileCollection {
    ArrayList<Projectile> projectiles;

    ProjectileCollection() {
        this.projectiles = new ArrayList<Projectile>();
    }
    void cullProjectile2() {
        // Lambda functions aren't supported in processing 3.5 so this implementation is used instead.
        // Removes projectiles that have hit their target and are now gone.

        ArrayList<Projectile> temp = new ArrayList<Projectile>();
        for(Projectile p : this.projectiles) {
            if(!p.gone) {
                temp.add(p);
            }
        }
        this.projectiles = temp;
    }

    void addProjectiles(Army army) {
        for(Soldier s : army.soldiers) {
            if(s.type.contains("Artillery")) {
               s.projectile = new ArtilleryProjectile(0, color(0, 255, 255), s.x, s.y, 50);
               this.projectiles.add(s.projectile);
            }
            else if(s.type.contains("Sniper")) {
                s.projectile = new Sniper_Projectile(0, color(255), s.x, s.y);
                this.projectiles.add(s.projectile);
            }
        }
    }
}