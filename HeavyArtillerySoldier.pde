class HeavyArtillerySoldier extends Soldier {
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    HeavyArtillerySoldier(String team, color typeC, color teamC, ArtilleryProjectile artProj, float x, float y) {
        // String type, String team, color typeC,
        // color teamC, int sight, Projectile proj, float speed, float x, float y
        super("Heavy Artillery", team, typeC, teamC, 10000, artProj, 0.5, x, y);
        this.vitality = 40;
    }

    @Override
    void display() {
        // Do not draw the soldier if it is dead.
        if(!this.alive) {
            return;
        }
        stroke(this.teamColour);

        strokeWeight(3);

        fill(this.typeColour);

        square(this.x, this.y, 15);

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
        // if there is no target / the target is dead, move east as if the unit's target is out of sight
        if(!this.target.alive) {
            // If the unit is out of bounds
            // Try to move away. (Usually this does not succeed.)
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
            // Pathfind towards the target.
            // Direction is determined by the sign of movement direction
            // for both the x and y directions.
            // Explained more in the soldier class.
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

        // Artillery units should not move if the target is in sight.
        // They will attack instead.
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            this.attack1(s);
        }
        // otherwise, default to moving east
        else {
            this.move(deltaX*this.speed, 0);
        }

        // Check if this unit is dead.
        if(this.target != null) {
            this.deathCheck();
        }
        this.display();
    }

    void attack1(Soldier target) {
        // fire projectile
        if(!this.alive) {
            return;
        }
        // Create a Runnable object that contains the code for attacking.
        final Runnable attack = new Runnable() {
            public void run() {
                if(!alive) {
                    return;
                }
                ArtilleryProjectile temp = new ArtilleryProjectile(0, color(255), x, y, 150);
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
                projectile.shoot(new HeavyArtillerySoldier(team, typeColour, teamColour, temp, x, y), target);
            }
        };
        // Set random starting delay and interval.
        int randomStart = floor(random(700, 900));
        int randomTime = floor(random(3000, 4000));
        // Use the scheduleAtFixedRate function (a part of ScheduledFuture) to attack at a fixed rate.
        final ScheduledFuture<?> attackHandle = scheduler.scheduleAtFixedRate(attack, randomStart, 500, MILLISECONDS);
        scheduler.schedule(new Runnable() {public void run() {attackHandle.cancel(true);}}, 1000, MILLISECONDS);
        // Low alpha (transparency) line.
        stroke(255, 120);
        // Draw targeting line.
        line(this.x, this.y, target.x, target.y);
        // Display the target to ensure that it is on top of the line.
        target.display();
    }

}
