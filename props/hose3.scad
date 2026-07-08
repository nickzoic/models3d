$fn=100;

    
difference() {
    hull() {
        translate([10,0,0]) cylinder(d=24,h=30);
        translate([-10,0,0]) cylinder(d=24,h=30);
        translate([0,0,25]) cylinder(d=24,h=30);
    }
    translate([10,0,0]) cylinder(d1=16.5,d2=13.5,h=2);
    translate([10,0,0]) cylinder(d=13.5,h=20);
    translate([10,0,0]) cylinder(d=10,h=27.5);
    
    translate([-10,0,0]) cylinder(d1=16.5,d2=13.5,h=2);
    translate([-10,0,0]) cylinder(d=13.5,h=20);
    translate([-10,0,0]) cylinder(d=10,h=27.5);
    
    translate([0,0,27.5]) cylinder(d=10,h=20);
    translate([0,0,35]) cylinder(d=13.5,h=20);
    translate([0,0,53]) cylinder(d1=13.5,d2=16.5,h=2);
    hull() {
        translate([-10,0,27.5]) sphere(d=10);
        translate([10,0,27.5]) sphere(d=10);
    }
    
    translate([0,25,12.5]) sphere(d=30);
    translate([0,-25,12.5]) sphere(d=30);
    //cube(100);
}