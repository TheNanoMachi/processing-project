class SoldierSniper extends Soldier {
    boolean attacked, running;
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 1);
        attacked = false;
        running = false;
    }
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj, float x, float y) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 1, x, y);
        attacked = false;
        running = false;
    }

    @Override
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
        //circle(this.x, this.y, this.sight*2);
        if(dist(this.x, this.y, s.x, s.y) <= this.sight) {
            //line(this.x, this.y, s.x, s.y);
            // if(this.running) {
            //     // move away if target is within 50 pixels of the unit
            //     //this.move(-deltaX*this.speed, -deltaY*this.speed);
            //     this.attacked = true;
            // }

            
            if(dist(this.x, this.y, s.x, s.y) <= 300) {
                this.attack(s);
            }
            else {
                this.move(deltaX*this.speed, deltaY*this.speed);
            }

        }
        else {
            this.move(this.speed, 0);
        }
        

        if(this.target != null)
            this.deathCheck();
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
                fill(255);
                line(x, y, target.x, target.y);
                Sniper_Projectile temp = new Sniper_Projectile(0, color(255), x, y);
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
        final ScheduledFuture<?> attackHandle = scheduler.scheduleAtFixedRate(attack, 1, 1, SECONDS);
        scheduler.schedule(new Runnable() {public void run() {attackHandle.cancel(true);}}, 1, SECONDS);
    }

    
}