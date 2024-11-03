$fn=100;

difference() {
    union() {
        translate([-12.5,0,0]) cylinder(d=25,h=10, center=true);
        translate([+12.5,0,0]) cylinder(d=25,h=10, center=true);
        rotate([90,0,0]) cylinder(d=10,h=20);
    }
    translate([-14,0,0]) cylinder(d=20,h=11, center=true);
    translate([+14,0,0]) cylinder(d=20,h=11, center=true);
    rotate([90,0,0]) cylinder(d=6,h=21);
    rotate([90,0,0]) cylinder(d=3,h=100,center=true);
 }