// print in TPU to go between 33mm clamp and 31.8mm bars.

$fn=100;

difference() {
    union() {
        cylinder(d=35, h=1);
        translate([0,0,1]) cylinder(d1=35,d2=33,h=1);
        cylinder(d=33, h=13);
        translate([0,0,11]) cylinder(d1=33,d2=35,h=1);
        translate([0,0,12]) cylinder(d=35,h=1);
    }
    cylinder(d=31,h=13);
    translate([-1,0,0]) cube([2,50,13]);
}