include <../saturnalia/gears.scad>;

// printed in PLA, 0.15mm layers,
// 3 walls, 4 top & bottom, 50% cubic sub infill
// no support necessary.

difference() {
    union() {
        cylinder(h=10,d=39);
        spur_gear(1, 42, 10, 10);
        translate([0,11,5]) cube([10.5,22,10],center=true);
    }
    translate([0,0,-1]) cylinder(d=36.25,h=12);
    translate([0,0,5]) rotate([-90,0,0]) cylinder(d=2,h=26);
    translate([0,0,5]) rotate([-90,0,0]) translate([0,0,20]) cylinder(d1=2,d2=4,h=1);
    translate([0,0,5]) rotate([-90,0,0]) translate([0,0,21]) cylinder(d=4,h=20);
    cylinder(d1=38,d2=36,h=1);
    translate([0,0,9]) cylinder(d1=36,d2=38,h=1);
}    


// damn near perfect fit for a
// Tower Pro Micro Servo 9G SG90
// single horn.

translate([0,45,0]) rotate([0,0,-90])
difference() {
    union() {
        spur_gear(1,21,5,5);
        hull() {
            cylinder(d=17,h=5);
            translate([14.5,0,0]) cylinder(d=7,h=5);
        }
    }
    cylinder(d=7,h=5);
    translate([0,0,3]) hull() {
        cylinder(d=6.5,h=5);
        translate([14.5,0,0]) cylinder(d=4,h=5);
    }
}