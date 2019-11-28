// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

// bearing is a cheap 6901Z
// motor is a 28BYJ-48

version = "v3";

face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
hole_circle_radius = 2.625 * 25.4 / 2;
hole_size = 5.5;
hole_sink_dia = 9;
hole_sink_dep = 4;

motor_diameter = 28;
motor_ear_width = 34.5;
motor_ear_screw = 3.5;
motor_shaft_offset = 7.5;
motor_wire_width = 15;
shaft_diameter = 5;
shaft_length = 6;
shaft_flat = 3;
pilot_diameter = 9.6;
pilot_depth = 2;

// mounting hole
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 70;
flange_thick = 4;
mount_screw_holes = 5;
mount_screw_size = 5;
mount_screw_length = 20;

// bearing
bearing_thick = 6;
bearing_od = 24.5;
bearing_id = 12;

wall_thick = 1.6;

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
    
    translate([-10,-10,wall_thick-1]) linear_extrude(2) text("n",halign="center", valign="center");
    translate([-10,10,wall_thick-1]) linear_extrude(2) text(version,halign="center", valign="center");
}
