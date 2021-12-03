class Projectile {
    float speed;
    float spread;
    int size;
    color colour;

    float x;
    float y;

    String type;

    Projectile(float speed, float spread, color colour, float x, float y, String type) {
        this.speed = speed;
        this.spread = spread;
        this.colour = colour;

        this.x = x;
        this.y = y;

        this.type = type;
    }

    void shoot(Soldier s) {
        this.x = s.x;
        this.y = s.y;
        stroke(colour);
        line(this.x, this.y, this.x-50, this.y-50);
    }


}
