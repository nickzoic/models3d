
$fn=64;

difference() {
    new_splash();
    translate([0,0,2.5]) feet_cutouts();
}

module new_splash() {
    difference() {
        union() {
            cylinder(d=70,h=1);
            translate([0,0,1]) rotate_extrude() {
                wave(34,0.75,3.75,2.5);
            }
        }
    }
}
        
module old_splash() {
    difference() {
        union() {
            cylinder(d=76,h=1);
            translate([0,0,1]) cylinder(d1=76,d2=74,h=1);
            translate([0,0,2]) cylinder(d1=64,d2=62, h=1);
            translate([0,0,3]) cylinder(d1=52,d2=50,h=1);
        }
    }
    translate([0,0,3]) cylinder(d1=38,d2=40,h=1);
    translate([0,0,2]) cylinder(d1=26,d2=24,h=1);
}

module right_foot() {
    intersection() { 
        translate([-140,-102,0]) import("orange.stl");
        translate([8,-3,0]) cylinder(d=40,h=100);
    }
}

module left_foot() {
    intersection() { 
        translate([-110,-102,0]) import("orange.stl");
        translate([-8,-3,0]) cylinder(d=40,h=100);
    }
}

module wave(r,a,b,h) {
    pp = [ [0,0], for (x = [0 : r]) [ x, ((sin(((b-a)*x/r+a)*360)+1.001)*h/2) ], [r,0] ];
    polygon(points=pp);
}

scale = 1.05;

module feet_cutouts() {
    translate([19,-2.5,0]) rotate([0,0,0]) scale(scale) left_foot();
    translate([-19.5,-1.75,0]) rotate([0,0,0]) scale(scale) right_foot();
}

/*
// this is a guide for manually aligning the feet
// 35mm apart at the heel tips
// 24mm apart at inside toe tips
#polygon(points=[
    [-12,-12],
    [+12,-12],
    [+17.5, +12],
    [-17.5, +12]
]);

feet_cutouts();
*/