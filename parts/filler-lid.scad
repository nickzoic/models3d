$fn=64;

difference() {
    union() {
        cylinder(h=12,d=49,$fn=7);
        rotate([0,0,360/14]) cylinder(h=12,d=49,$fn=7);
    }
    translate([0,0,2]) cylinder(h=10,d=38.5);
    translate([0,0,2]) cylinder(h=6,d=42.5);
    translate([0,0,8]) cylinder(h=1,d1=42.5,d2=38.5);
    translate([0,0,11]) cylinder(h=6,d=42.5);
    intersection() {
        cube([29,100,100], center=true);
        translate([0,0,2]) cylinder(h=10,d=42.5);
    }
    cylinder(d=4.5,h=10);
}