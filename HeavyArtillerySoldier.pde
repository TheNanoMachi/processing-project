class HeavyArtillerySoldier extends Soldier {
    HeavyArtillerySoldier(String team, color typeC, color teamC, Projectile artProj, float x, float y) {
        // String type, String team, color typeC,
        // color teamC, int sight, Projectile proj, float speed, float x, float y
        super("Heavy Artillery", team, typeC, teamC, 600, artProj, 1, x, y);
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
        if(!this.target.alive) {
            if(this.x <= 20) {
                this.deltaX = 5;
                this.deltaY = 0;
            }
            else if(this.x >= 990) {
                this.deltaX = -5;
                this.deltaY = 0;
            }
            if((this.y <= 20)) {
                this.deltaX = 0;
                this.deltaY = 5;
            }
            else if(this.y >= 990) {
                this.deltaX = 0;
                this.deltaY = -5;
            }
            return;
        }
        if (!((this.x <= 10) || (this.x >= 990) || (this.y <= 10) || (this.y >= 990))) {
            this.deltaX = (s.x - this.x);
            if (this.deltaX < 0) {
                this.deltaX = -1;
            }
            else if (this.deltaX > 0) {
                this.deltaX = 1;
            }
            else {
                this.deltaX = 0;
            }
            this.deltaY = (s.y - this.y);
            if (this.deltaY < 0) {
                this.deltaY = -1;
            }
            else if (this.deltaY > 0) {
                this.deltaY = 1;
            }
            else {
                this.deltaY = 0;
            }
        }
        else {
            if(this.x <= 10) {
                this.deltaX = 5;
                this.deltaY = 0;
            }
            else if(this.x >= 990) {
                this.deltaX = -5;
                this.deltaY = 0;
            }
            if((this.y <= 10)) {
                this.deltaX = 0;
                this.deltaY = 5;
            }
            else if(this.y >= 990) {
                this.deltaX = 0;
                this.deltaY = -5;
            }
        }
        
        // Clear fill colour to avoid drawing persistent trails.
        stroke(255);
        strokeWeight(2);
        fill(0, 0, 0, 0);

        //Artillery units should not move if the target is in sight.
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            if(dist(this.x, this.y, s.x, s.y) <= 10) { // TODO: replace this with field
                this.attack();
            }
        }
        // otherwise, default to moving east
        else {
            this.move(deltaX*this.speed, 0);
        }
        // if the enemy has a projectile
        // take damage from it
        if(!(s.projectile == null)) {
            if(abs(this.x - abs(s.projectile.x)) <= s.projectile.deltaX * s.projectile.speed && abs(this.y - abs(s.projectile.y)) <= s.projectile.deltaY * s.projectile.speed) {
                this.takeDamage(s.projectile);
            }
        }

        if(this.target != null) {
            this.deathCheck();
        }
    }

    void attack(Soldier target) {
        // fire projectile
        if(!this.alive) {
            return;
        }
        this.projectile.shoot(this, target);
    }

}