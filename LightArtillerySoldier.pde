class LightArtillerySoldier extends Soldier {
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    LightArtillerySoldier(String team, color typeC, color teamC, ArtilleryProjectile artProj, float x, float y) {
        super("Light Artillery", team, typeC, teamC, 1000, artProj, 1, x, y);
        this.vitality = 40;
    }

    @Override
    void display() {
        // Do not draw the soldier if it is dead.
        if(!this.alive) {
            return;
        }

        // Draw the soldier as a circle with radius 5
        stroke(this.teamColour);

        strokeWeight(3);

        fill(this.typeColour);

        square(this.x, this.y, 15);

        // or as a square with width and height 10

        // if(this.drawSquare) {
        //     noStroke();
        //     fill(this.teamColour, this.alpha);
        //     square(this.x, this.y, 10);
        // }
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

        //Artillery units should not move if the target is in sight.
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            this.attack(s);
        }
        // otherwise, default to moving east
        else {
            this.move(deltaX*this.speed, 0);
        }

        if(this.target != null) {
            this.deathCheck();
        }
        this.display();
    }

    
    void attack(Soldier target) {
        // fire projectile
        if(!this.alive) {
            return;
        }
        final Runnable attack = new Runnable() {
            public void run() {
                if(!alive) {
                    return;
                }              
                ArtilleryProjectile temp = new ArtilleryProjectile(0, color(255), x, y, 200);
                if(teamColour == teamRed) {
                    for(Soldier s : blue.soldiers) {
                        if(dist(s.x, s.y, target.x, target.y) <= temp.aoeRange / 2) {
                            s.takeDamage(temp, true);
                        }
                        else if(dist(s.x, s.y, target.x, target.y) <= temp.aoeRange && dist(s.x, s.y, target.x, target.y) >= temp.aoeRange / 2) {
                            s.takeDamage(temp, false);
                        }
                    }
                }
                else {
                    for(Soldier s : red.soldiers) {
                        if(dist(s.x, s.y, target.x, target.y) <= temp.aoeRange / 2) {
                            s.takeDamage(temp, true);
                        }
                        else if(dist(s.x, s.y, target.x, target.y) <= temp.aoeRange && dist(s.x, s.y, target.x, target.y) >= temp.aoeRange / 2) {
                            s.takeDamage(temp, false);
                        }
                    }
                }
                projectile.shoot(new LightArtillerySoldier(team, typeColour, teamColour, temp, x, y), target);
            }
        };
        int randomStart = floor(random(700, 900));
        int randomTime = floor(random(2000, 3500));
        final ScheduledFuture<?> attackHandle = scheduler.scheduleAtFixedRate(attack, randomStart, randomTime, MILLISECONDS);
        scheduler.schedule(new Runnable() {public void run() {attackHandle.cancel(true);}}, 1, SECONDS);
        stroke(255, 120);
        line(this.x, this.y, target.x, target.y);
        target.display();
    }
}
