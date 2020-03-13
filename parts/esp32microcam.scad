$fn=200;

difference() {
    union() {
        cylinder(d1=22,d2=23,h=5);
        translate([0,0,5]) cylinder(d=23,h=18);
        translate([0,0,24]) cube([15,15,2],center=true);
    }
    cylinder(d1=19,d2=8.5,h=22);
    translate([0,0,22]) cylinder(d=8.5,h=1);
    translate([0,0,24]) cube([8.5,8.5,2],center=true);
}

translate([30,0,7]) {
    difference() {
        cube([30,43,14], center=true);
        translate([0,9,-6]) cube([15.5,15.5,2],center=true);
        difference() {
            translate([0,0,1]) cube([27,40.5,12], center=true);
            translate([-12,+18.75,-4]) cube([3,3,2],center=true);
            translate([+12,+18.75,-4]) cube([3,3,2],center=true);
            translate([-12,-18.75,-4]) cube([3,3,2],center=true);
            translate([+12,-18.75,-4]) cube([3,3,2],center=true);
        }
        translate([0,20,-4]) cube([14,5,2],center=true);
        translate([0,45.75,-4]) cylinder(d=50,h=6,center=true);
        translate([0,45.75,0]) cylinder(d1=50,d2=48,h=2,center=true);
        
        translate([-12,-9.5,-7]) cylinder(d=3,h=5);
    }
}
