wall_thick = 1.6;
version = "v1";


// motor is a 28BYJ-48, very cheap little motor
// with a built-in 64:1 (approx) gearbox
motor_diameter = 28;
motor_extra = 31;
motor_ear_width = 34.5;
motor_ear_screw = 3;
motor_shaft_offset = 7;
motor_depth = 19;

$fn=64;

difference() {
    cylinder(d1=65,d2=50,h=23);
    translate([0,0,21]) cylinder(d=48,h=5);
    translate([motor_shaft_offset,0,1]) cylinder(d=motor_diameter,h=21);
    translate([motor_shaft_offset,motor_ear_width/2, 2]) cylinder(d=motor_ear_screw,h=20);
    translate([motor_shaft_offset,-motor_ear_width/2, 2]) cylinder(d=motor_ear_screw,h=20);
    translate([15,-0,12]) cube([15,15,22],center=true);
    translate([25,-0,22]) cube([15,6,8],center=true);
    for(a=[-30,30]) rotate([0,0,a]) {
    translate([-16,0,1]) cylinder(d1=6,d2=16,h=22);
    translate([-25,0,2.5]) cube([20,6,3],center=true);
    }
}

translate([60,0,0])
difference() {
    union() {
        cylinder(d=50,h=5);
        hull() rotate_extrude() translate([5.5,5]) circle(d=3);
    }
    difference() {
        hull() rotate_extrude() {
            translate([21,5]) circle(d=6);
        }
        difference() {
            cylinder(d=20,h=10);
            rotate_extrude() {
                translate([10,5]) circle(d=6);
            }
        }
        difference() {
            cube([7,100,20],center=true);
            translate([3.5,0,5]) rotate([90,0,0]) cylinder(d=6,h=100,center=true);
            translate([-3.5,0,5]) rotate([90,0,0]) cylinder(d=6,h=100,center=true);
        }
        difference() {
            cube([100,7,20],center=true);
            translate([0,3.5,5]) rotate([0,90,0]) cylinder(d=6,h=100,center=true);
            translate([0,-3.5,5]) rotate([0,90,0]) cylinder(d=6,h=100,center=true);
        }
    }
    translate([0,0,3]) intersection() {
        cylinder(d=5.3,h=6,center=true);
        cube([6,3.3,6], center=true);
    }
    //cube(100);
}