// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

bearing_id = 12;
total_height = 30;
shaft_diameter = 6.35;
shaft_length = 15;

// pinion
gear_modulus = (305*1.1)/(9*13);
gear_height = 8;

include <./gears.scad>;

difference() {
    union() {
        translate([0,0,1]) spur_gear(gear_modulus, 8, gear_height, 6);
        translate([0,0,gear_height+1]) cylinder(d=bearing_id+2,h=1);
        translate([0,0,1]) cylinder(d=bearing_id,h=total_height-1);
        cylinder(d1=8,d2=bearing_id,h=1);
    }
    translate([0,0,total_height-shaft_length]) cylinder(d=shaft_diameter,h=shaft_length+2);
   translate([0,0,0.5]) sphere(d=6);
    cylinder(d=1,h=total_height);
}
