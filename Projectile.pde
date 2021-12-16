class Projectile {
    float speed;
    float spread;
    int size;
    color colour;

    float x;
    float y;
    float targetX, targetY;

    float deltaX, deltaY;

    String type;
    boolean fired;
    boolean gone;
    boolean resetShotFlag;

    float damage;

    Projectile(float speed, float spread, color colour, float x, float y, String type) {
        this.speed = speed;
        this.spread = spread;
        this.colour = colour;

        this.x = x;
        this.y = y;

        this.type = type;
        this.fired = false;

        this.targetX = 0;
        this.targetY = 0;

        this.deltaX = 0;
        this.deltaY = 0;
        this.gone = false;
        this.resetShotFlag = false;
        this.damage = 10;
    }

    void shoot(Soldier s, Soldier target) {
        // Reset certain fields of the projectile if necessary.
        if(this.resetShotFlag) {
            this.fired = false;
            this.gone = false;
            this.resetShotFlag = false;
            this.x = s.x;
            this.y = s.y;
        }
        // if the projectile no longer needs to be rendered, remove it
        if(this.fired) {
            return;
        }
        if(this.gone) {
            return;
        }
        deltaX = 0;
        deltaY = 0;
        // If the projectile has not yet been fired, set x, y, and targets
        if(!this.fired) {
            this.x = s.x;
            this.y = s.y;
            this.targetX = target.x;
            this.targetY = target.y;

            fired = true; 
        }
        // Pathfinding only needs to be done once.
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
        // remove the projectile if it has reached its target
        if(this.x - targetX <= 5 && this.y - targetY <= 5) {
            gone = true;
        }
    }

    void move(float xMag, float yMag) {
        // Move the projectile as a circle, in case it needs to be displayed.
        this.x += xMag;
        this.y += yMag;
        stroke(colour);
        circle(this.x, this.y, 10);
    }

}
