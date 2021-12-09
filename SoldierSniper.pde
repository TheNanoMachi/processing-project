class SoldierSniper extends Soldier {
    boolean attacked, running;
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5);
        attacked = false;
        running = false;
    }
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj, float x, float y) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5, x, y);
        attacked = false;
        running = false;
    }

    @Override
    void pathfind(Soldier s) {
        if(!alive) {
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
            if(!this.running) {
                // move away if target is within 50 pixels of the unit
                this.move(-deltaX*this.speed, -deltaY*this.speed);
                this.attacked = true;
            }

        }
        else {
            this.move(this.speed, 0);
        }
        if(dist(this.x, this.y, s.x, s.y) <= 50) {
            this.running = true;
            this.runAway();
        }
        if(dist(this.x, this.y, s.x, s.y) <= 20) {
            this.takeDamage();
        } 

        if(this.target != null)
            this.deathCheck();
    }

    void attack(Soldier target) {
        // fire projectile
        this.projectile.shoot(this, target);
    }
}