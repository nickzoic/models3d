$fn=64;

difference() {
    cylinder(d1=25,d2=10,h=8);
    translate([0,0,7]) sphere(d=6);
    translate([0,0,-1]) cylinder(d=2.5,h=10);
    translate([0,0,2.75]) cylinder(d1=2.5, d2=5, h=1.25);
    translate([0,0,4]) cylinder(d=5,h=1.5);
    translate([0,0,9]) cube([0.25,25,10],center=true);
    translate([0,0,9]) cube([25,0.25,10],center=true);
}
