// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

// motor is a 28BYJ-48

version = "v4";

// motor is a 28BYJ-48, very cheap little motor
// with a built-in 64:1 (approx) gearbox
motor_diameter = 28;
motor_ear_width = 34.5;
motor_ear_screw = 3.5;
motor_shaft_offset = 7;
shaft_diameter = 5.5;
shaft_length = 6;
shaft_flat = 3.5;
pilot_diameter = 9.6;
pilot_depth = 2;

// mounting hole in wood.  Use a 51mm hole 
// saw and then clean it up with a rasp.
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 70;
flange_thick = 4;
mount_screw_holes = 5;
mount_screw_size = 5;
wall_thick = 1.6;

// bearing is a cheap 6901Z ... leave .25mm clearance
// for assembly.
bearing_thick = 6;
bearing_od = 24.25;
bearing_id = 11.75;

// pinion gear & shaft: modulus must 
// match the big gear.
gear_modulus = (305*1.1)/(9*13);
gear_height = 8;
gear_teeth = 7;
total_height = 16+gear_height+1;
ball_size = 8;

// calculated offset between center of mount
// and center of motor shaft
eccentric = (mount_diameter - bearing_od) / 2 - 3;
$fn=64;

difference() {
    union() {
        cylinder(d = flange_diameter, h=flange_thick);
        cylinder(d = mount_diameter, h=flange_thick+mount_thick-1);
        translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=mount_diameter,d2=mount_diameter-2,h=1);   
    }
    difference() {
        translate([0,0,wall_thick]) cylinder(d = mount_diameter - wall_thick*2,h=100);
        translate([eccentric,0,0]) cylinder(d = bearing_od+wall_thick*2,h=100);
        translate([eccentric-motor_shaft_offset,motor_ear_width/2,0]) cylinder(d=motor_ear_screw+wall_thick*2,h=100);
        translate([eccentric-motor_shaft_offset,-motor_ear_width/2,0]) cylinder(d=motor_ear_screw+wall_thick*2,h=100);
        translate([eccentric-motor_shaft_offset,0,0]) cube([wall_thick,100,100], center=true);
        cube([100,wall_thick,100],center=true);    
    }
    translate([eccentric,0,0]) {
        cylinder(d = pilot_diameter, h=pilot_depth+1);
        translate([0,0,pilot_depth]) cylinder(d=bearing_id+2,h=100);
        translate([0,0,wall_thick]) cylinder(d=bearing_od-2,h=100);
        translate([0,0,flange_thick+mount_thick-bearing_thick]) cylinder(d=bearing_od,h=100);
        translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=bearing_od,d2=bearing_od+2,h=1);
    }
    translate([eccentric-motor_shaft_offset,motor_ear_width/2,0]) cylinder(d=motor_ear_screw,h=100);
    translate([eccentric-motor_shaft_offset,-motor_ear_width/2,0]) cylinder(d=motor_ear_screw,h=100);
    
    for (n = [0:mount_screw_holes-1]) {
        rotate([0,0,n*360/mount_screw_holes]) {
            translate([flange_diameter/2-mount_screw_size,0,-1]) cylinder(d=mount_screw_size, h=flange_thick+2);
        }
    }
    translate([-(flange_diameter/2),0,0]) rotate([0,0,45]) cube([10,10,100],center=true);    
    
    translate([-10,-10,wall_thick-1]) linear_extrude(2) text("ñ",halign="center", valign="center");
    translate([-10,10,wall_thick-1]) linear_extrude(2) text(version,halign="center", valign="center");
}
include <./gears.scad>

translate([-(flange_diameter+gear_modulus*gear_teeth)/2,0,0]) {
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
    }
}