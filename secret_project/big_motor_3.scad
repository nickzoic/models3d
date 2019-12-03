// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

version = "5";

// motor is a NEMA 23 stepper also from the junkbox.
// I think it's been in the junkbox for almost 30 years.

face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
hole_circle_radius = 2.625 * 25.4 / 2;
hole_size = 5.5;
hole_sink_dia = 9;
hole_sink_dep = 4;

shaft_diameter = 6.35;
shaft_length = 15;
pilot_diameter = 38.75;
pilot_depth = 1.5;

// mounting hole in wood.  Use a 51mm hole 
// saw and then clean it up with a rasp.
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 100;
flange_thick = 6;
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
//eccentric = (mount_diameter - bearing_od) / 2 - 3;
eccentric = 6;

$fn=64;

difference() {
    union() {
        hull() {    
            cylinder(d = flange_diameter, h=flange_thick);
            translate([eccentric-gear_modulus*(secondary_teeth+primary_teeth)/2,0,0]) cylinder(d=80, h=flange_thick);
        }
        cylinder(d = mount_diameter, h=flange_thick+mount_thick-1);
        translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=mount_diameter,d2=mount_diameter-2,h=1);   
    }
    difference() {
        translate([0,0,wall_thick]) cylinder(d = mount_diameter - wall_thick*2,h=100);
        translate([eccentric,0,0]) cylinder(d = bearing_od+wall_thick*2,h=100);
        cube([100,wall_thick,100],center=true);
        translate([eccentric,0,0]) cube([wall_thick,100,100],center=true);    
    }
    translate([eccentric,0,0]) {
        cylinder(d = bearing_od, h=bearing_thick);
        cylinder(d=bearing_od-2,h=100);
        translate([0,0,flange_thick+mount_thick-bearing_thick]) cylinder(d=bearing_od,h=100);
        translate([0,0,flange_thick+mount_thick-1]) cylinder(d1=bearing_od,d2=bearing_od+2,h=1);
    
    }
    
    for (n = [0:mount_screw_holes-1]) {
        rotate([0,0,n*360/mount_screw_holes]) {
            translate([flange_diameter/2-mount_screw_size,0,-1]) cylinder(d=mount_screw_size, h=flange_thick+2);
        }
    }
    translate([-(flange_diameter/2),0,0]) rotate([0,0,45]) cube([10,10,100],center=true);    
    
    translate([-15,-10,wall_thick-0.5]) linear_extrude(1) text("n",halign="center", valign="center");
    translate([-15,10,wall_thick-0.5]) linear_extrude(1) text(version,halign="center", valign="center");
}

include <./gears.scad>

primary_teeth=7;
secondary_teeth=23;
secondary_square=bearing_id/1.42;

translate([eccentric,0,-11]) difference() {
    spur_gear(gear_modulus, secondary_teeth, 10);
    translate([0,0,5]) cube([secondary_square,secondary_square,10],center=true);
}

translate([eccentric-gear_modulus*(secondary_teeth+primary_teeth)/2,0,-11]) difference() {
    spur_gear(gear_modulus,primary_teeth, 10);
    cylinder(d=shaft_diameter,h=10);
}

translate([eccentric-gear_modulus*(secondary_teeth+primary_teeth)/2,0,-22]) difference() {
    cylinder(d=80, h=flange_thick+12);
    translate([40,0,flange_thick]) cylinder(d=80, h=12);
    cylinder(d=pilot_diameter, h=pilot_depth);
    cylinder(d=pilot_diameter-4, h=flange_thick+12);
    for (a = [0:90:360]) {
        rotate([0,0,a]) translate([hole_circle_radius,0,0]) {
            cylinder(d=hole_size, h=flange_thick);
            translate([0,0,flange_thick-hole_sink_dep]) cylinder(d=hole_sink_dia, h=100);
        }
    }
}


translate([-(flange_diameter+gear_modulus*gear_teeth)/2,0,0]) {
    difference() {
        union() {
            translate([0,0,0]) spur_gear(gear_modulus, gear_teeth, gear_height, 6);
            translate([0,0,gear_height]) cylinder(d=bearing_id+2,h=1);
            cylinder(d=bearing_id, h=total_height-10);
            translate([0,0,total_height-10]) cube([secondary_square,secondary_square,10],center=true);
            
            //cylinder(d1=8,d2=bearing_id,h=1);
        }
        translate([0,0,2.5]) sphere(d=ball_size+0.5);
        cylinder(d=3,h=total_height);
        cylinder(d=ball_size-0.5,h=ball_size/3);
    }
}