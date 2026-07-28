$fn=32;

difference() {
    hull() {
        translate([0,0,34]) rotate([0,90,0]) cylinder(h=47,d=10,center=true);
        translate([0,0,2.5]) cube([47,30,5],center=true);
    }
    translate([0,0,34]) rotate([0,90,0]) cylinder(h=47,d=3.5,center=true);
    translate([0,0,26]) rotate([0,90,0]) cylinder(h=47,d=3.5,center=true);
    translate([0,-5,21]) rotate([0,90,0]) cylinder(h=47,d=3.5,center=true);
    
    translate([0,5,21]) rotate([0,90,0]) cylinder(h=47,d=3.5,center=true);
    translate([0,0,16]) rotate([0,90,0]) cylinder(h=47,d=3.5,center=true);
    translate([0,0,30]) cube([37,30,50],center=true);
    cylinder(d=4,h=5);
    translate([10,7.5,0]) cylinder(d=4,h=5);
    translate([-10,7.5,0]) cylinder(d=4,h=5);
    translate([10,-7.5,0]) cylinder(d=4,h=5);
    translate([-10,-7.5,0]) cylinder(d=4,h=5);
}
