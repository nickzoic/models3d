// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

shaft_diameter = 5.5;
shaft_length = 6;
shaft_flat = 3.5;

bearing_id = 12 - 0.5; // allow a little clearance

// pinion
gear_modulus = (305*1.1)/(9*13);
gear_height = 8;
gear_teeth = 7;

total_height = 16+gear_height+1;

// ball bearing in bottom
ball_size = 8;

include <./gears.scad>;

difference() {
    union() {
        translate([0,0,0]) spur_gear(gear_modulus, gear_teeth, gear_height, 6);
        translate([0,0,gear_height]) cylinder(d=bearing_id+2,h=1);
        cylinder(d=bearing_id,h=total_height-2);
        translate([0,0,total_height-2]) cylinder(d1=bearing_id,d2=bearing_id-1.5,h=2);
        
        //cylinder(d1=8,d2=bearing_id,h=1);
    }
    translate([0,0,total_height-shaft_length/2]) intersection() {
        cylinder(d=shaft_diameter,h=shaft_length+2,center=true);
        cube([shaft_diameter,shaft_flat,shaft_length+2],center=true);
    }
    translate([0,0,total_height-1]) cylinder(d=shaft_diameter,h=2);
    
    translate([0,0,2.5]) sphere(d=ball_size+0.5);
    cylinder(d=shaft_flat,h=total_height);
    cylinder(d=ball_size-0.5,h=ball_size/3);
    translate([0,0,total_height-4]) rotate([90,0,0]) cylinder(d=1.2,h=20,center=true);
}
