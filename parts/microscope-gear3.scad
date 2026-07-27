// notes from version 1
// * print it thicker, more like 15mm
// * stepper offset is 8mm not 7mm so gear too loose
// * sleeve fit & taper is all wrong.
// * motor shaft cutout too thick
// at least the motor fits nicely.

include <../saturnalia/gears.scad>;

id = 39;

gp = 1;
gt = 50;

for(x=[0,50]) translate([x,0,0]) {
intersection() {
    difference() {
        cylinder(d1=42.5,d2=42,h=10);
        cylinder(d=39,h=10);
        cylinder(d1=41,d2=39,h=1);
        translate([0,0,5]) rotate([0,0,45]) cube([41/sqrt(2),41/sqrt(2),10],center=true);
        translate([0,0,5]) cube([41/sqrt(2),41/sqrt(2),10],center=true);
        translate([0,1,5]) cube([1,42,10],center=true);
    }
    cylinder(d1=60, d2=40,h=10);
}
}

translate([100,0,0]) {
    intersection() {
        difference() {
            spur_gear(1, 50, 10, 10, optimized=false);
            cylinder(d1=42.5,d2=42,h=10);
            cylinder(d1=44.5,d2=42.5,h=1);
        }
        union() {
            cylinder(d1=48,d2=70,h=5);
            translate([0,0,5]) cylinder(d1=70,d2=48,h=5);
        }
    }
}

translate([0,50,0]) {
    intersection() {
        union() {
            spur_gear(1, 50, 10, 5.5, optimized=true);
            translate([2.5,0,5]) cube([1.5,6,10],center=true);
            translate([-2.5,0,5]) cube([1.5,6,10],center=true);
        }
        union() {
            cylinder(d1=48,d2=70,h=5);
            translate([0,0,5]) cylinder(d1=70,d2=48,h=5);
        }
    }
    cylinder(d=6,h=2);
}

translate([55,50,0])
difference() {
    hull() {
        cylinder(d=50,h=10);
        translate([37,0,0]) cylinder(d=45,h=10);
    }
    cylinder(d1=42.5,d2=42,h=10);
    cylinder(d1=44.5,d2=42.5,h=1);
    translate([43,0,0]) cylinder(d=28.5,h=10);
    translate([43,0,0]) cylinder(d1=30.5,d2=28.5,h=1);
    translate([30,0,5]) cube([10,18,10],center=true);
    translate([30,0,8]) cube([14,9,4],center=true);
    
    translate([43,17.25,0]) cylinder(d=3.5,h=10);
    translate([43,-17.25,0]) cylinder(d=3.5,h=10);
    translate([23,18,0]) cube([6,3,10]);
}

motor_diameter = 28;
motor_ear_width = 34.5;
motor_ear_screw = 3.5;
motor_shaft_offset = 7;
shaft_diameter = 5.5;
shaft_length = 6;
shaft_flat = 3.5;
pilot_diameter = 9.6;
pilot_depth = 2;