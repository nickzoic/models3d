$fn=100;

difference() {
    union() {
        hull() {
            translate([0,0,0]) cylinder(d1=24, d2=26, h=5);
            translate([23,0,0]) cylinder(d=10, h=20);
            translate([0,23,0]);    
        }
        intersection() {
            translate([0,0,20]) sphere(d=42);
            translate([0,0,10]) cube([10,50,20],center=true);            
        }
        translate([0,0,20]) rotate([90,0,0]) cylinder(d=10,h=42,center=true);
        translate([0,0,20]) rotate([90,0,0]) cylinder(d=5,h=46,center=true);
  
 }
    translate([0,0,20]) sphere(d=40);
    translate([23,0,0]) cylinder(d=6,h=8);
    translate([23,0,0]) cylinder(d=2,h=100);
}