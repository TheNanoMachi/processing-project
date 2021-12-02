class Soldier {
    String type;
    String team;
    color teamColour;
    color typeColour;
    float alpha;
    float x;
    float y;
    int sight;
    boolean drawSquare;

    Soldier(String type, String team, color typeC, color teamC, int sight) {
        this.type = type;
        this.team = team;
        this.teamColour = teamC;
        this.typeColour = typeC;
        this.x = 500;
        this.y = 500;
        this.drawSquare = false;
        this.alpha = alpha;
        this.sight = sight;
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

    void pathfind(Soldier other) {
        ArrayList<float
        float distanceTo = dist(this.x, this.y, other.x, other.y);
        
    }
}
