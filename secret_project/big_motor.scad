// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!


// Offset of mount hole from center is 
// half tooth diameter of big gear (305*1.1/2)
// plus half tooth diameter of pinion (~10mm for 7 teeth)
// then the eccentric lets you adjust this by a few mm
// ~177 mm.

// bearing is some NSK 6202V which was in the junkbox.
// a much cheaper bearing would do the trick just fine.

// motor is a NEMA 23 stepper also from the junkbox.
// I think it's been in the junkbox for almost 30 years.

face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
hole_circle_radius = 2.625 * 25.4 / 2;
hole_size = 5;
hole_sink_dia = 9;
hole_sink_dep = 4;

shaft_diameter = 6.35;
shaft_length = 15;
pilot_diameter = 38.5;
pilot_depth = 1.5;

// mounting hole
mount_diameter = 51;
mount_thick = 15;
flange_diameter = 90;
flange_thick = 8;
mount_screw_holes = 5;
mount_screw_size = 4;

// bearing
bearing_thick = 11;
bearing_od = 35;
bearing_id = 15;

eccentric = (mount_diameter - bearing_od) / 2 - 3;

$fn=64;

difference() {
    union() {
        cylinder(d = mount_diameter, h = mount_thick);
        translate([0,0,mount_thick]) cylinder(d = flange_diameter, h=flange_thick);
    }
    translate([eccentric,0,-1]) {
        cylinder(d = bearing_od-4, h = mount_thick+flange_thick+2);
        cylinder(d = bearing_od, h = bearing_thick+1);
        for (a = [45:90:360]) {
            rotate([0,0,a]) translate([hole_circle_radius,0,0]) {
                cylinder(d=hole_size, h=mount_thick+flange_thick+2);
                cylinder(d=hole_sink_dia, h=mount_thick+hole_sink_dep+1);
            }
        }
        translate([0,0,mount_thick+flange_thick-pilot_depth+1]) cylinder(d=pilot_diameter, h=pilot_depth+1);
    }
    for (n = [0:mount_screw_holes-1]) {
        rotate([0,0,n*360/mount_screw_holes]) {
            translate([flange_diameter/2-mount_screw_size,0,0]) cylinder(d=mount_screw_size, h=mount_thick+flange_thick+2);
        }
    }
    translate([-50,0,mount_thick+flange_thick+6]) rotate([45,0,0]) cube([100,10,10],center=true);
    translate([-(flange_diameter/2+6),0,0]) rotate([0,0,45]) cube([10,10,100],center=true);
}