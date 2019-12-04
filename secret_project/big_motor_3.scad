// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

version = "v5";

// motor is a NEMA 23 stepper also from the junkbox.
// I think it's been in the junkbox for almost 30 years.

motor_face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
motor_hole_circle_radius = 2.625 * 25.4 / 2;
motor_hole_circle_offset = motor_hole_circle_radius/sqrt(2);
motor_mount_diameter = 78;
motor_hole_size = 5.5;
motor_hole_sink_dia = 9;
motor_hole_sink_dep = 4;

motor_shaft_diameter = 6.35;
motor_shaft_length = 15;
motor_pilot_diameter = 38.75;
motor_pilot_depth = 1.5;

// mounting hole in wood.  Use a 51mm hole 
// saw and then clean it up with a rasp.
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 100;
flange_thick = 5;
mount_screw_holes = 5;
mount_screw_size = 5;
wall_thick = 1.5;

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
                cylinder(d = flange_diameter-wall_thick*2, h=flange_thick);
                //translate([primary_offset,0,0]) cylinder(d=motor_mount_diameter, h=flange_thick);
                translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=flange_thick);
                translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=flange_thick);
            }
            translate([-eccentric,0,0]) {
                cylinder(d = mount_diameter, h=flange_thick+mount_thick-1);
                translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=mount_diameter,d2=mount_diameter-2,h=1);
            }   
        }
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

show_cover_piece = 1;
if (show_cover_piece) {
    translate([0,0,-flange_thick-primary_height]) {
        difference() {
            hull() {    
                cylinder(d = flange_diameter, h=flange_thick*2+primary_height);
                //translate([primary_offset,0,0]) cylinder(d=motor_mount_diameter, h=flange_thick+primary_height);
                translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia+wall_thick*2,h=flange_thick*2+primary_height);
                translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia+wall_thick*2,h=flange_thick*2+primary_height);
            }
            translate([0,0,flange_thick]) hull() {    
                cylinder(d = flange_diameter - wall_thick*2, h=primary_height+flange_thick);
                //translate([primary_offset,0,0]) cylinder(d=motor_mount_diameter - wall_thick*2, h=primary_height);
                translate([primary_offset+motor_hole_circle_offset,-motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=primary_height+flange_thick);
                translate([primary_offset+motor_hole_circle_offset,+motor_hole_circle_offset,0]) cylinder(d=motor_hole_sink_dia,h=primary_height+flange_thick);
      
            }
            translate([primary_offset,0,0]) {
                for (a = [45:90:360]) {
                    rotate([0,0,a]) translate([motor_hole_circle_radius,0,0]) {
                        cylinder(d=motor_hole_size, h=flange_thick);
                        translate([0,0,flange_thick-motor_hole_sink_dep]) cylinder(d=motor_hole_sink_dia, h=100);
                    }
                }
                cylinder(d=motor_pilot_diameter, h=motor_pilot_depth);
                cylinder(d=motor_pilot_diameter-4, h=flange_thick);
            }
            translate([0,0,flange_thick-1]) linear_extrude(1) text(version,halign="center", valign="center");
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
        }
    }
}

show_primary_input_gear=1;
if (show_primary_input_gear) {
    translate([primary_offset,0,-primary_height+primary_clear]) {
       difference() {
           spur_gear(primary_modulus,primary_input_teeth,primary_height - 2 *primary_clear);
           cylinder(d=motor_shaft_diameter,h=primary_height);
       }
   }
}

show_output_shaft=1;
if (show_output_shaft) {
    difference() {
        union() {
            translate([0,0,-primary_height/2+primary_clear/2]) cube([output_square,output_square,primary_height-primary_clear],center=true);
            translate([0,0,-primary_clear]) cylinder(d=bearing_id, h=primary_clear+flange_thick+mount_thick);
            translate([0,0,flange_thick+mount_thick]) cylinder(d=bearing_id+4,h=1);
            translate([0,0,flange_thick+mount_thick+1]) spur_gear(gear_modulus, gear_teeth, gear_height, 6);
            cylinder(h=flange_thick+mount_thick+1+gear_height,d=ball_size);
        }
        translate([0,0,flange_thick+mount_thick+1+gear_height-ball_size/2+2]) sphere(d=ball_size+0.5);
        cylinder(h=flange_thick+mount_thick+1+gear_height,d=3);
    }
}