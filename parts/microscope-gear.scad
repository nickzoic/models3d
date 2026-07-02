include <../saturnalia/gears.scad>;

difference() {
    union() {
        intersection() {
            cylinder(h=10,d=52);
            translate([0,0,0]) cube(110);
        }
        cylinder(h=10,d=39);
        spur_gear(2, 24, 10, 10);
    }
    translate([0,0,-1]) cylinder(d=36,h=12);
    translate([0,0,5]) rotate([-90,0,-45]) cylinder(d=2,h=26);
    translate([0,0,5]) rotate([-90,0,-45]) translate([0,0,20]) cylinder(d1=2,d2=4,h=1);
    translate([0,0,5]) rotate([-90,0,-45]) translate([0,0,21]) cylinder(d=4,h=20);
    cylinder(d1=38,d2=36,h=1);
    translate([0,0,9]) cylinder(d1=36,d2=38,h=1);
    //cube(100);
}    