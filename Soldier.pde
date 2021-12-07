class Soldier {
    String type;
    String team;
    color teamColour;
    color typeColour;
    float alpha;
    float x;
    float y;
    int sight;
    float speed;
    boolean drawSquare;
    Projectile projectile;
    Soldier target;

    Soldier(String type, String team, color typeC, color teamC, int sight, Projectile proj) {
        this.type = type;
        this.team = team;
        this.teamColour = teamC;
        this.typeColour = typeC;
        this.x = 500;
        this.y = 500;
        this.drawSquare = false;
        this.alpha = alpha;
        this.sight = sight;
        this.speed = 5;
        this.projectile = proj;
    }
    Soldier(String type, String team, color typeC, color teamC, int sight, Projectile proj, float speed) {
        this.type = type;
        this.team = team;
        this.teamColour = teamC;
        this.typeColour = typeC;
        this.x = 500;
        this.y = 500;
        this.drawSquare = false;
        this.alpha = alpha;
        this.sight = sight;
        this.speed = speed;
        this.projectile = proj;
    }
    Soldier(String type, String team, color typeC, color teamC, int sight, Projectile proj, float speed, float x, float y) {
        this.type = type;
        this.team = team;
        this.teamColour = teamC;
        this.typeColour = typeC;
        this.x = x;
        this.y = y;
        this.drawSquare = false;
        this.alpha = alpha;
        this.sight = sight;
        this.speed = speed;
        this.projectile = proj;
    }

    void display() {
        stroke(this.teamColour);
        strokeWeight(3);
        fill(this.typeColour);
        circle(this.x, this.y, 10);
        if(this.drawSquare) {
            noStroke();
            fill(this.teamColour, this.alpha);
            square(this.x, this.y, 20);
        }
    }

    void move(float xMag, float yMag) {
        this.x += xMag;
        this.y += yMag;
        this.display();
    } 
    // The method is for melee units. Ranged units will start moving backwards
    // and attempt to keep distance if an enemy is too close.
    void pathfind(Soldier s) {
        this.target = s;
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
        
        stroke(255);
        strokeWeight(2);
        fill(0, 0, 0, 0);
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            this.move(deltaX*this.speed, deltaY*this.speed);
            if(dist(this.x, this.y, s.x, s.y) <= 10) { // TODO: replace this with field
                this.attack();
            }
        }
        else {
        }
    }

    void attack() {
       // each soldier type will attack differently.
    }

    void runAway() {
        int xChoice = int(random(-1, 1));
        int yChoice = int(random(-1, 1));
        this.move(xChoice*this.speed, yChoice*this.speed);
    }
}
