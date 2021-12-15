class HeavyArtillerySoldier extends Soldier {
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    HeavyArtillerySoldier(String team, color typeC, color teamC, ArtilleryProjectile artProj, float x, float y) {
        // String type, String team, color typeC,
        // color teamC, int sight, Projectile proj, float speed, float x, float y
        super("Heavy Artillery", team, typeC, teamC, 200, artProj, 0.5, x, y);
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
                this.attack();
        }
        // otherwise, default to moving east
        else {
            this.move(deltaX*this.speed, 0);
        }
        // if the enemy has a projectile
        // take damage from it
        if(!(s.projectile == null)) {
            if(abs(this.x - abs(s.projectile.x)) <= s.projectile.deltaX * s.projectile.speed && abs(this.y - abs(s.projectile.y)) <= s.projectile.deltaY * s.projectile.speed) {
                this.takeDamage(s.projectile);
            }
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
                fill(0, 255, 255, 128);
                
                ArtilleryProjectile temp = new ArtilleryProjectile(0, color(255), x, y, 60);
                circle(target.x, target.y, temp.aoeRange);
                if(teamColour == teamRed) {
                    for(Soldier s : blue.soldiers) {
                        if(dist(x, y, s.x, s.y) <= temp.aoeRange / 2) {
                            s.takeDamage(temp, true);
                        }
                        else if(dist(x, y, s.x, s.y) <= temp.aoeRange && dist(x, y, s.x, s.y) >= temp.aoeRange / 2) {
                            s.takeDamage(temp, false);
                        }
                    }
                }
                else {
                    for(Soldier s : red.soldiers) {
                        if(dist(x, y, s.x, s.y) <= temp.aoeRange / 2) {
                            s.takeDamage(temp, true);
                        }
                        else if(dist(x, y, s.x, s.y) <= temp.aoeRange && dist(x, y, s.x, s.y) >= temp.aoeRange / 2) {
                            s.takeDamage(temp, false);
                        }
                    }
                }
                projectile.shoot(new HeavyArtillerySoldier(team, typeColour, teamColour, temp, x, y), target);
            }
        };
        final ScheduledFuture<?> attackHandle = scheduler.scheduleAtFixedRate(attack, 1, 1, SECONDS);
        scheduler.schedule(new Runnable() {public void run() {attackHandle.cancel(true);}}, 1, SECONDS);
    }

}