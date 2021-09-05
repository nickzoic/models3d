// two screw surface mount for a 3.5mm TRS female-female audio connector

$fn=100;

difference() {
    sphere(d=36);
    translate([0,0,-50]) cube([100,100,100], center=true);
    translate([0,0,10]) rotate([90,0,0]) cylinder(d=9,h=100,center=true);
    for (x=[-11,11]) {
        translate([x,0,0]) cylinder(d=5,h=20);
        translate([x,0,5]) cylinder(d1=5,d2=9,h=2);
        translate([x,0,7]) cylinder(d=9,h=20);
    }
    cube([0.25,100,20],center=true);
}
