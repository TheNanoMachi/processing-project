class SoldierSniper extends Soldier {
    boolean attacked;
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5);
        attacked = false;
    }
    SoldierSniper(String team, color typeC, color teamC, Sniper_Projectile sniperProj, float x, float y) {
        super("Sniper", team, typeC, teamC, 500, sniperProj, 5, x, y);
        attacked = false;
    }

    @Override
    void pathfind(Soldier s) {
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
            this.move(-deltaX*this.speed, -deltaY*this.speed);
            this.attacked = true;
            if(dist(this.x, this.y, this.target.x, this.target.y) <= 30) {
                this.runAway();
            }
        }
        else {
            this.move(this.speed, 0);
        }
    }

    void attack(Soldier target) {
        this.projectile.shoot(this, target);
    }
}