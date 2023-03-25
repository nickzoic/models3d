$fn=32;

// hat segment thickness
h1 = 5;

// hat brim thickness
h2 = 2;

// hat body hole diameter
d1 = 5;

// hat body diameter
d2 = 10;

// hat brim diameter
d3 = 25;

module hat_white() {
    difference() {
        union() {
            cylinder(h=h1*6,d=d1*0.9);
            translate([0,0,h1*6]) sphere(d=d1*0.9);
        }
        translate([0,0,h1*5.75]) rotate([0,90,0]) cylinder(h=d3,d=d1/2,center=true);
    }
    cylinder(h=h2,d=d3);

    for (k = [-1,1]) {
        translate([(d2+d3)/2,k*d2/2+k,0])    difference() {
            cylinder(h=h1-0.5,d1=d2+1,d2=d2);
            cylinder(h=5,d=5);
        }
    }
}

module hat_red() {
    for (k = [-1,0,1]) {
        translate([-(d2+d3+1)/2,-k*(d2+1.5),0])    difference() {
            cylinder(h=h1-0.5,d1=d2+abs(k*2),d2=d2+abs(k));
            cylinder(h=5,d=5);
        }
    }
}

for (r=[0,1]) {
    for (y=[0,1,2,3,4]) {
        translate([0,y*d3+y/2,0]) rotate([0,0,r*180]) translate([d3/2+0.5,0,0]) hat_white();
    }
}
