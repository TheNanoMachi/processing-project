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
    }

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
            println("working");
            fired = true; 

        }

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

        println(deltaX, deltaY, this.x, this.y, targetX, targetY);
        this.move(deltaX*this.speed, deltaY*this.speed);
        if(this.x - targetX <= 5 && this.y - targetY <= 5) {
            println("gone");
            gone = true;
        }
        

        // stroke(colour);
        // line(this.x, this.y, this.x-50, this.y-50);
    }

    void move(float xMag, float yMag) {
        this.x += xMag;
        this.y += yMag;
        stroke(colour);
        line(this.x, this.y, this.x+(deltaX*50), this.y+(deltaY*50));
    }

}
