// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

version = "v7";

// motor is a NEMA 23 stepper also from the junkbox.
// I think it's been in the junkbox for almost 30 years.

motor_face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
motor_hole_circle_radius = 2.625 * 25.4 / 2;
motor_hole_circle_offset = motor_hole_circle_radius/sqrt(2);
motor_mount_diameter = 78;
motor_hole_size = 5.5;
motor_hole_sink_dia = 9;
motor_hole_sink_dep = 4;

motor_shaft_diameter = 6.35 - 0.1;  // fiddled slightly to fit.
motor_shaft_length = 19;
motor_pilot_diameter = 38.75;
motor_pilot_depth = 1.5;

// mounting hole in wood.  Use a 51mm hole 
// saw and then clean it up with a rasp.
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 102;
flange_thick = 5;
mount_screw_size = 5;
mount_screw_offset = 15;
mount_screw_surround = 12;
wall_thick = 2.5;

// bearing is a cheap 6901Z ... leave .25mm clearance
// for assembly.
bearing_thick = 6;
bearing_od = 24.25;
bearing_id = 11.75;

// square drive which fits through the bearings.
output_square = bearing_id / 1.42;

// pinion gear & shaft: modulus must 
// match the big gear.
gear_modulus = (305*1.1)/(9*13);
gear_height = 8;
gear_teeth = 7;
total_height = 16+gear_height+1;
ball_size = 8;

// calculated offset between center of mount
// and center of motor shaft
//eccentric = (mount_diameter - bearing_od) / 2 - 3;
eccentric = 6;

// primary (pre-reduction) gearing doesn't have to be the 
// same modulus as the secondary ... make it a bit smaller
// to allow a bigger output gear.
primary_modulus = 2.3;
primary_input_teeth = 7;
primary_output_teeth = 39;
primary_offset = primary_modulus*(primary_input_teeth+primary_output_teeth)/2;
primary_height = 10;
primary_clear = 1;

// top cover
cover_thick = 4;
cover_motor_thick=8;
cover_height = motor_shaft_length+motor_pilot_depth+2+flange_thick;

include <./gears.scad>
$fn=64;

// base piece which plugs into the chipboard
// axis at [0,0] is output shaft
// axis at [primary_offset,0] is motor shaft
// axis at [-eccentric,0] is base mount

show_base_piece = 1;
if (show_base_piece) {
    difference() {
        union() {
            hull() {    
                cylinder(d = flange_diameter-wall_thick*2-0.5, h=flange_thick);
                translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia-0.5,h=flange_thick);
                translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia-0.5,h=flange_thick);
            }
            translate([-eccentric,0,0]) {
                cylinder(d = mount_diameter, h=flange_thick+mount_thick-1);
                translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=mount_diameter,d2=mount_diameter-2,h=1);
            }   
        }
        translate([primary_offset-motor_hole_circle_offset+mount_screw_offset,motor_hole_circle_offset+motor_hole_sink_dia,0]) cylinder(d=mount_screw_size,h=primary_height+flange_thick+2);
        translate([primary_offset-motor_hole_circle_offset+mount_screw_offset,-motor_hole_circle_offset-motor_hole_sink_dia,0]) cylinder(d=mount_screw_size,h=primary_height+flange_thick+2);

        difference() {
            translate([-eccentric,0,wall_thick]) cylinder(d = mount_diameter - wall_thick*2,h=100);
            cylinder(d = bearing_od+wall_thick*2,h=100);
            cube([100,wall_thick,100],center=true);
            cube([wall_thick,100,100],center=true);    
        }
        cylinder(d = bearing_od, h=bearing_thick);
        cylinder(d=bearing_od-2,h=100);
        translate([0,0,flange_thick+mount_thick-bearing_thick]) cylinder(d=bearing_od,h=100);
        translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=bearing_od,d2=bearing_od+2,h=1);
        
        translate([primary_offset,0,flange_thick-1]) linear_extrude(1) text(version,halign="center", valign="center");
    }
}

show_cover_piece = 0;
if (show_cover_piece) {
    translate([0,0,-cover_height+flange_thick]) {
        difference() {
            union() {
                hull() {    
                    cylinder(d = flange_diameter, h=cover_height);
                    translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia+wall_thick*2,h=cover_height);
                    translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia+wall_thick*2,h=cover_height);
                }
                for (a = [135,225]) {
                    rotate([0,0,a]) {
                        difference() {
                            union() {
                                translate([flange_diameter/2,0,cover_height/2]) cube([mount_screw_surround,mount_screw_surround,cover_height],center=true);
                                translate([flange_diameter/2+mount_screw_surround/2,0,0])    cylinder(d=mount_screw_surround,h=cover_height);
                            }
                            translate([flange_diameter/2+mount_screw_surround/2,0,0])    cylinder(d=mount_screw_size,h=cover_height+2);
                        }
                    }
                }
            } 
            difference() {
                translate([0,0,cover_thick]) hull() {    
                    cylinder(d = flange_diameter - wall_thick*2, h=cover_height);
                    translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=cover_height);
                    translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=cover_height);
                }
                translate([75+primary_offset-motor_hole_circle_offset-motor_hole_sink_dia,0,cover_motor_thick/2]) cube([150,150,cover_motor_thick],center=true);
                translate([primary_offset-motor_hole_circle_offset+15,motor_hole_circle_offset+motor_hole_sink_dia,0]) cylinder(d=mount_screw_surround,h=cover_height-flange_thick);
                translate([primary_offset-motor_hole_circle_offset+15,-motor_hole_circle_offset-motor_hole_sink_dia,0]) cylinder(d=mount_screw_surround,h=cover_height-flange_thick);
                translate([primary_offset+motor_hole_circle_offset,-12.5,0]) cube([5,25,cover_height-flange_thick]);    
            }
            translate([primary_offset-motor_hole_circle_offset+mount_screw_offset,motor_hole_circle_offset+motor_hole_sink_dia,0]) cylinder(d=mount_screw_size,h=cover_height);
                translate([primary_offset-motor_hole_circle_offset+mount_screw_offset,-motor_hole_circle_offset-motor_hole_sink_dia,0]) cylinder(d=mount_screw_size,h=cover_height);
            translate([primary_offset,0,0]) {
                for (a = [45:90:360]) {
                    rotate([0,0,a]) translate([motor_hole_circle_radius,0,0]) {
                        cylinder(d=motor_hole_size, h=flange_thick);
                        translate([0,0,cover_motor_thick-motor_hole_sink_dep]) cylinder(d=motor_hole_sink_dia, h=100);
                    }
                }
                cylinder(d=motor_pilot_diameter, h=motor_pilot_depth);
                cylinder(d=motor_pilot_diameter-4, h=cover_height);
            }
            translate([primary_offset,motor_pilot_diameter/2+1,cover_motor_thick-1]) linear_extrude(1) text(version,halign="", valign="bottom");
        }
    }
}

show_primary_output_gear=1;
if (show_primary_output_gear) {
    translate([0,0,-primary_height+primary_clear]) {
        difference() {
            union() {
                spur_gear(primary_modulus,primary_output_teeth,primary_height - 2 *primary_clear);
                cylinder(d=bearing_id+4,h=primary_height-primary_clear);
            }
            for (a=[0:90:359]) {
                rotate([0,0,a]) translate([primary_modulus*primary_output_teeth/4,0,0]) cylinder(h=primary_height, d=primary_modulus*primary_output_teeth/3.33);
            }
            translate([0,0,primary_height/2]) cube([output_square,output_square,primary_height],center=true);
            rotate([0,180,45]) translate([0,primary_modulus*primary_output_teeth/3,0]) linear_extrude(0.5) text(version,halign="center",valign="center");
        }
    }
}

show_primary_input_gear=1;
if (show_primary_input_gear) {
    translate([primary_offset,0,-cover_height+cover_motor_thick+motor_pilot_depth]) {
       difference() {
           union() {
               translate([0,0,1]) spur_gear(primary_modulus, primary_input_teeth, motor_shaft_length-1);
               cylinder(h=motor_shaft_length, d=motor_shaft_diameter+3);
           } 
           cylinder(d=motor_shaft_diameter,motor_shaft_length-1);
           cylinder(d=2,motor_shaft_length);
           translate([0,0,motor_shaft_length-0.5]) linear_extrude(1) text(version,halign="center",valign="center",size=5);
       }
   }
}

show_output_shaft=1;
if (show_output_shaft) {
    difference() {
        union() {
            translate([0,0,-primary_height/2-primary_clear/2]) cube([output_square,output_square,primary_height-primary_clear],center=true);
            translate([0,0,-primary_clear]) cylinder(d=bearing_id, h=primary_clear+flange_thick+mount_thick);
            translate([0,0,flange_thick+mount_thick-1]) cylinder(d=bearing_id+4,h=2);
            translate([0,0,flange_thick+mount_thick+1]) spur_gear(gear_modulus, gear_teeth, gear_height, 6);
            cylinder(h=flange_thick+mount_thick+1+gear_height,d=ball_size);
            translate([0,0,-primary_height-primary_clear]) rotate([0,180,0]) linear_extrude(1) text(version,halign="center",valign="center",size=5);
        }
        translate([0,0,flange_thick+mount_thick+1+gear_height-ball_size/2+2]) sphere(d=ball_size+0.5);
        cylinder(h=flange_thick+mount_thick+1+gear_height,d=3);
        cylinder(d=2,h=100,center=true);
    }
}