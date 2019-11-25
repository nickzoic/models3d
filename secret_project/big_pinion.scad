// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

bearing_id = 15;
total_height = 27;
shaft_diameter = 6.35;
shaft_length = 18;

// pinion
gear_modulus = (305*1.1)/(9*13);
gear_height = 8;
gear_teeth = 7;

// ball bearing in bottom
ball_size = 8;

include <./gears.scad>;

difference() {
    union() {
        translate([0,0,0]) spur_gear(gear_modulus, gear_teeth, gear_height, 6);
        translate([0,0,gear_height]) cylinder(d=bearing_id+2,h=1);
        cylinder(d=bearing_id,h=total_height-1);
        //cylinder(d1=8,d2=bearing_id,h=1);
    }
    translate([0,0,total_height-shaft_length]) cylinder(d=shaft_diameter,h=shaft_length+2);
   translate([0,0,2]) sphere(d=ball_size+0.5);
    cylinder(d=2,h=total_height);
    cylinder(d=ball_size-0.5,h=ball_size/3);
    translate([0,0,total_height-shaft_diameter]) rotate([90,0,0]) cylinder(d=2,h=20,center=true);
}
