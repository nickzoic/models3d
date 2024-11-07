$fn=100;

difference() {
    hull() {
        translate([1,0,0]) cylinder(d1=20, d2=25, h=5);
        translate([23,0,0]) cylinder(d=10, h=10);
    }
    translate([0,0,20]) sphere(d=40);
    translate([23,0,0]) cylinder(d=6,h=8);
    translate([23,0,0]) cylinder(d=2,h=11);
}