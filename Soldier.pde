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
    float vitality;
    float armour;
    boolean alive;
    float deltaX, deltaY;
    float damage, damageMax, damageMin;

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
        this.vitality = 10;
        this.alive = true;
        this.deltaX = 0;
        this.deltaY = 0;
        this.damage = 10;
        this.damageMax = 3;
        this.damageMin = -3;
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
        this.vitality = 10;
        this.alive = true;
        this.deltaX = 0;
        this.deltaY = 0;
        this.damage = 10;
        this.damageMax = 3;
        this.damageMin = -3;
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
        this.vitality = 10;
        this.alive = true;
        this.deltaX = 0;
        this.deltaY = 0;
        this.damage = 10;
        this.damageMax = 3;
        this.damageMin = -3;
    }
    Soldier(String type, String team, color typeC, color teamC, int sight, float speed, float x, float y) {
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
        this.vitality = 10;
        this.alive = true;
        this.deltaX = 0;
        this.deltaY = 0;
        this.damage = 10;
        this.damageMax = 3;
        this.damageMin = -3;
    }

    void display() {
        // Do not draw the soldier if it is dead.
        if(!this.alive) {
            return;
        }

        // Draw the soldier as a circle with radius 5
        stroke(this.teamColour);

        strokeWeight(3);

        fill(this.typeColour);

        circle(this.x, this.y, 15);

        // or as a square with width and height 10

        if(this.drawSquare) {
            noStroke();
            fill(this.teamColour, this.alpha);
            square(this.x, this.y, 10);
        }
    }

    void move(float xMag, float yMag) {
        // Move the soldier by a certain x and y value.
        this.display();
        this.x += xMag;
        this.y += yMag;       
    } 

    // The method is for melee units. Ranged units will start moving backwards
    // and attempt to keep distance if an enemy is too close.
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
                this.deltaX = 20;
                this.deltaY = 0;
            }
            else if(this.x >= 990) {
                this.deltaX = -20;
                this.deltaY = 0;
            }
            if((this.y <= 20)) {
                this.deltaX = 0;
                this.deltaY = 20;
            }
            else if(this.y >= 990) {
                this.deltaX = 0;
                this.deltaY = -20;
            }
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

        // This is default movement behaviour for melee units.
        // Move towards the enemy if detected (via this.sight)
        // attack if in range
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            // fill(this.teamColour);
            // line(this.x, this.y, this.target.x, this.target.y);
            this.move(this.deltaX*this.speed, this.deltaY*this.speed);
            if(dist(this.x, this.y, s.x, s.y) <= 10) { // TODO: replace this with field
                this.attack();
            }
        }
        // otherwise, default to moving east
        else {
            if(this.teamColour == teamBlue) {
                this.move(deltaX*this.speed, 0);
            }
            else {
                this.move(-deltaX*this.speed, 0);
            }
        }
        // if no target, default to moving east as well, or west for red team
        if(this.target == null) {
            if(this.teamColour == teamBlue) {
                this.move(deltaX*this.speed, 0);
            }
            else {
                this.move(-deltaX*this.speed, 0);
            }
        }

        if(this.target != null) {
            this.deathCheck();
        }
        
        this.display();
    }

    void attack() {
       // each soldier type will attack differently.
       // as such this method is left blank so subclasses can override it.
    }

    void runAway() {
        // Pick a random direction to run in.
        int xChoice = int(random(-2, 2));
        int yChoice = int(random(-2, 2));
        this.move(xChoice*this.speed, yChoice*this.speed);
    }

    void die() {
        // very simple death function
        if(!this.alive) {
            return;
        }
        this.alive = false;
        if(this.teamColour == teamRed) {
            redCasualties++;
        }
        else {
            blueCasualties++;
        }
    }

    void takeDamage(Projectile p) {
        if(!this.alive) {
            return;
        }
        // remove damage from vitality. Die if necessary
        this.vitality -= p.damage;
        if(this.vitality <= 0) {
            this.die();
        }
    }

    // overloaded function for artillery only.
    void takeDamage(Projectile p, boolean inRange) {
        if(!this.alive) {
            return;
        }
        if(inRange) {
            this.vitality -= p.damage;
        }
        else {
            this.vitality -= floor(p.damage / (float) 2);
        }
        this.vitality -= p.damage;
        if(this.vitality <= 0) {
            this.die();
        }
    }

    void takeDamage(Soldier s) {
        if(!this.alive) {
            return;
        }
        // Randomizes damage by randomMin, randomMax
        this.vitality -= s.damage + random(s.damageMin, s.damageMax);
        if(this.vitality <= 0) {
            this.die();
        }
    }

    void deathCheck() {
        // check if target is dead
        if(!this.target.alive) {
            this.target = null;
        }
    }
}
