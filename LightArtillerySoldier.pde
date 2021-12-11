class LightArtillerySoldier extends Soldier {
    LightArtillerySoldier(String team, color typeC, color teamC, Projectile artProj, float x, float y) {
        super("Light Artillery", team, typeC, teamC, 600, artProj, 4, x, y);
    }

    @Override
    // Movement is slightly different for artillery.
    void pathfind(Soldier s) {
        // stop execution if the soldier is dead.
        if(!this.alive) {
            return;
        }
        // set target
        this.target = s;
        // if there is no target, move east as if the unit's target is out of sight
        if(this.target == null) {
            println("no more target");
            this.move(this.speed, 0);
            return;
        }
        // pathfinding algorithm is split into two parts.
        // Establishing direction (this part below)
        // and movement (done by move())


        // Direction is established by looking at the difference between
        // the position of the target and the current position.
        // If this is positive, the target is in front.
        // If it's negative the target is behind.
        // If either difference of X or Y is zero, the target is on one of the cardinal directions
        // north (0, +y), south (0, -y), east (+x, 0), or west(-x, 0)
        float deltaX = (s.x - this.x);
        if (deltaX < 0) {
            deltaX = -1;
        }
        else if (deltaX > 0) {
            deltaX = 1;
        }
        else {
            deltaX = 0;
        }
        float deltaY = (s.y - this.y);
        if (deltaY < 0) {
            deltaY = -1;
        }
        else if (deltaY > 0) {
            deltaY = 1;
        }
        else {
            deltaY = 0;
        }
        
        // Clear fill colour to avoid drawing persistent trails.
        stroke(255);
        strokeWeight(2);
        fill(0, 0, 0, 0);

        // Artillery units move only if they cannot see the enemy.
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            this.attack();
        }
        // Move if target not in range/no target.
        else {
            this.move(this.speed, 0);
        }
        // if the enemy has a projectile
        // take damage from it
        if(!(s.projectile == null)) {
            if(abs(this.x - abs(s.projectile.x)) <= s.projectile.deltaX * s.projectile.speed && abs(this.y - abs(s.projectile.y)) <= s.projectile.deltaY * s.projectile.speed) {
                this.takeDamage(s.projectile);
            }
        }
        // reverse direction if the unit is going out of bounds
        if(this.x <= 0 || this.x >= 1000 || this.y <= 0 || this.y >= 1000) {
            deltaX *= -1;
            deltaY *= -1;
        }

        if(this.target != null) {
            this.deathCheck();
        }
    }

    
    void attack(Soldier target) {
        // fire projectile
        this.projectile.shoot(this, target);
    }
}