// mount stepper motor through panel, 
// with another bearing to keep the shaft aligned.
// check dimensions!

// NEMA 23 motor
face_size = 2.3 * 25.4 + 1;  // with an allowance to fit
hole_circle_radius = 2.625 * 25.4 / 2;
pilot_diameter = 1.5 * 25.4;
hole_size = 5;
shaft_diameter = 6.35;
shaft_length = 15;

// mounting hole
mount_diameter = 52;
mount_thick = 10;
flange_width = 20;
flange_thick = 10;
mount_screw_holes = 13;
mount_screw_size = 4;

// bearing
bearing_thick = 10;
bearing_od = 35.5;
bearing_id = 15;

difference() {
    union() {
        cylinder(d = mount_diameter, h = mount_thick);
        translate([0,0,mount_thick]) cylinder(d = mount_diameter + flange_width * 2, h=flange_thick);
    }
    translate([(mount_diameter - pilot_diameter) / 2 - 2,0,-1]) {
        cylinder(d = bearing_od-4, h = mount_thick+flange_thick+2);
        cylinder(d = bearing_od, h = bearing_thick+1);
        translate([0,0,mount_thick+flange_thick-4]) cylinder(d = pilot_diameter, h=3);
        for (a = [45:90:360]) {
            rotate([0,0,a]) translate([hole_circle_radius,0,0]) cylinder(d=hole_size, h=mount_thick+flange_thick+2);
        }
        translate([0,0,mount_thick+flange_thick]) cube([face_size, face_size, 3], center=true);
    }
    for (n = [0:mount_screw_holes-1]) {
        rotate([0,0,n*360/mount_screw_holes]) {
            translate([mount_diameter/2+flange_width-mount_screw_size,0,0]) cylinder(d=mount_screw_size, h=mount_thick+flange_thick+2);
        }
    }
    translate([-50,0,mount_thick+flange_thick+6]) rotate([45,0,0]) cube([100,10,10],center=true);
    translate([-mount_diameter/2-flange_thick-16,0,0]) rotate([0,0,45]) cube([10,10,100],center=true);
}