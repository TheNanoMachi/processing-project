class ArtilleryProjectile extends Projectile {
    float aoeRange;
    ArtilleryProjectile(float spread, color colour, float x, float y, float area) {
        super(10, spread, colour, x, y, "Artillery");
        this.damage = 30;
        // set area of effect range
        this.aoeRange = area;
    }

    @Override
    void shoot(Soldier s, Soldier target) {
        if(this.gone) {
            return;
        }
        deltaX = -0;
        deltaY = -0;
        if(!this.fired) {
            this.x = s.x;
            this.y = s.y;
            this.targetX = target.x;
            this.targetY = target.y;
            fired = true; 

        }
        // explained more in Projectile.
        deltaX = (targetX - this.x);
        if (deltaX < 0) {
            deltaX = -1;
        }
        else if (deltaX > 0) {
            deltaX = 1;
        }
        else {
            deltaX = 0;
        }
        deltaY = (targetY - this.y);
        if (deltaY < 0) {
            deltaY = -1;
        }
        else if (deltaY > 0) {
            deltaY = 1;
        }
        else {
            deltaY = 0;
        }
        this.move(deltaX*this.speed, deltaY*this.speed);
        // if the projectile has reached its target, remove it
        if(this.x - targetX <= 5 && this.y - targetY <= 5) {
            gone = true;
        }
    }
}
