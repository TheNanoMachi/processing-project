class Soldier {
    String type;
    String team;
    color teamColour;
    color typeColour;
    float x;
    float y;
    boolean drawSquare;

    Soldier(String type, String team, color teamC, color typeC) {
        this.type = type;
        this.team = team;
        this.teamColour = teamC;
        this.typeColour = typeC;
        this.x = 0;
        this.y = 0;
        this.drawSquare = false;
    }

    void display() {
        stroke(this.teamColour);
        strokeWeight(10);
        circle(this.typeColour, this.x,  this.y);
        if(this.drawSquare) {
            
        }
    }
}