$fn=20;
start = 10;
delta = 0.5;
limit = 6;
length = 1.5;
c = 5;
t = 4;

module fnord(x) {
    union() {
        cylinder(h=x*length,d1=x+c,d2=x-1+c);
        if(x>limit) {
            translate([0,0,x*length]) {
                rotate([30,0,0]) fnord(x-delta);
                rotate([0,14.5,75]) fnord(x-delta);
            }
        }
        if (x==limit) {
            translate([0,0,length*x])
            sphere(d=limit-1+c);
        }
    }
}

fnord(start);
translate([0,0,-15]) cylinder(d1=65,d2=65,h=3, $fn=50);
translate([0,0,-12]) cylinder(d1=50,d2=start+c+5,h=6, $fn=50);
translate([0,0,-6]) cylinder(d1=start+c+5,d2=start+c,h=6);