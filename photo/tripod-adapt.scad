w1 = 42;
w2 = 34.5;
h1 = 7.5;
r1 = 2.5;
w3 = 25;

o1 = w1/2-r1;
o2 = w2/2-r1;

o3 = w3/2;
d3 = 3;

g1 = 1;

d1 = 65;
h2 = 7.5;

h4 = 3;

$fn=64;

difference() {
    union() {
        hull() {
            for (xx = [-1,+1]) {
                for (yy = [-1,+1]) {
                    translate([o1*xx,o1*yy,0]) cylinder(h=0.5,r=r1);
                    translate([o2*xx,o2*yy,h1-1]) cylinder(h=1,r=r1);
                }
            }
        }
        hull() {
            for (xx = [-1,+1]) {
                for (yy = [-1,+1]) {
                    translate([o2*xx,o2*yy,h1]) cylinder(h=g1,r=r1);
                }
            }
        }
        translate([0,0,h1+g1]) cylinder(d=d1,h=h2);
    }
    for (xx = [-o3,0,o3]) {
        for (yy = [-o3,0,o3]) {
            translate([xx,yy,-1]) cylinder(h=h1+h2+2,d=d3);
        }
    }
    hull() {
        for (xx = [-1,+1]) {
            for (yy = [-1,+1]) {
                translate([o3*xx,o3*yy,-1]) cylinder(h=h4+1,d=d3);
            }
        }
    }
    
}