class SoldierSniper extends Soldier {
    boolean attacked, running;
    // create a thread pool for scheduler
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 1);
        attacked = false;
        running = false;
        this.vitality = 1;
    }
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj, float x, float y) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 1, x, y);
        attacked = false;
        running = false;
        this.vitality = 1;
    }

    @Override
    // Snipers move mostly the same as other units
    void pathfind(Soldier s) {
        if(!this.alive) {
            return;
        }
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
        // pathfinding is the same as other soldiers
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
        // Snipers attack and move a bit differently.
        /*
        Snipers will move only if:
        - They are not in range of the target (300 pixels) but the target is in sight
        - or they are not in range or in sight.
         */
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            
            if(dist(this.x, this.y, s.x, s.y) <= 300) {
                // attack if in sight
                this.attack(s);
            }
            else {
                this.move(deltaX*this.speed, deltaY*this.speed);
            }

        }
        else {
            this.move(this.speed, 0);
        }
        
        // check if the target is dead
        if(this.target != null)
            this.deathCheck();
        this.display();
    }

    void attack(Soldier target) {
        if(!this.alive) {
            return;
        }
        // same stuff as Heavy/LightArtillerySoldier basically
        final Runnable attack = new Runnable() {
            public void run() {
                if(!alive) {
                    return;
                }
                Sniper_Projectile temp = new Sniper_Projectile(0, color(255), x, y);
                // except here, since snipers do point damage instad of area-of-effect
                if(teamColour == teamRed) {
                    for(Soldier s : blue.soldiers) {
                        if(s.x == target.x && s.y == target.y) {
                            s.takeDamage(temp);
                        }
                    }
                }
                else {
                    for(Soldier s : red.soldiers) {
                        if(s.x == target.x && s.y == target.y) {
                            s.takeDamage(temp);
                        }
                    }
                }
                projectile.shoot(new SoldierSniper(team, typeColour, teamColour, temp, x, y), target);
            }
        };
        int randomTime = floor(random(1500, 2500));
        final ScheduledFuture<?> attackHandle = scheduler.scheduleAtFixedRate(attack, randomTime, randomTime, MILLISECONDS);
        scheduler.schedule(new Runnable() {public void run() {attackHandle.cancel(true);}}, 1, SECONDS);
        stroke(teamColour, 150);
        // draw a targeting line.
        line(this.x, this.y, target.x, target.y);
    }
}
