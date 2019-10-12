
$fn=64;

difference() {
    union() {
        cylinder(d=64,h=1);
        translate([0,0,1]) cylinder(d1=64,d2=62, h=1);
        translate([0,0,2]) cylinder(d1=52,d2=50,h=1);
        translate([0,0,3]) cylinder(d1=40,d2=38,h=1);
    }
    
    translate([0,0,2.5]) difference() { 
        translate([-125,-102,0]) import("orange.stl");
        translate([0,10,0]) cylinder(d=18,h=10);
    }
}
