$fn=100;

difference() {
    union() {
        translate([15,0,0]) cylinder(d=24,h=32.5);
        translate([-15,0,0]) cylinder(d=24,h=32.5);
        translate([0,0,32.5]) cylinder(d=24,h=27.5);
        hull() {
            translate([15,0,32.5]) sphere(d=24);
            translate([-15,0,32.5]) sphere(d=24);
        }
        difference() {
            translate([0,0,20]) cube([10,5,6],center=true);
            translate([0,0,16.5]) rotate([0,45,0]) cube([6,6,6],center=true);
        }
    }
    translate([15,0,0]) cylinder(d1=16.5,d2=13.5,h=2);
    translate([15,0,0]) cylinder(d=13.5,h=20);
    translate([15,0,0]) cylinder(d=10,h=32.5);
    
    translate([-15,0,0]) cylinder(d1=16.5,d2=13.5,h=2);
    translate([-15,0,0]) cylinder(d=13.5,h=20);
    translate([-15,0,0]) cylinder(d=10,h=32.5);
    
    translate([0,0,27.5]) cylinder(d=10,h=20);
    translate([0,0,35]) cylinder(d=13.5,h=20);
    translate([0,0,53]) cylinder(d1=13.5,d2=16.5,h=2);
    hull() {
        translate([-15,0,32.5]) sphere(d=10);
        translate([15,0,32.5]) sphere(d=10);
    }
    
    translate([0,25,12.5]) sphere(d=30);
    translate([0,-25,12.5]) sphere(d=30);
    
    for (a=[6,9,12]) {
        translate([15,0,0]) rotate_extrude()  translate([12,a]) circle(d=2, $fn=12);
        translate([-15,0,0]) rotate_extrude()  translate([12,a]) circle(d=2, $fn=12);
        translate([0,0,43]) rotate_extrude()  translate([12,a]) circle(d=2, $fn=12);
    }
    
    cube(100);
}