$fn=100;

module holder() {
    difference() {
        union() {
            translate([0,0,10]) cube([38,12,15], center=true);
            translate([0,0,17]) rotate([90,0,0]) cylinder(d=38,h=12, center=true);
        }
        
        translate([0,0,21]) rotate([90,0,0]) cylinder(d=16,h=100, center=true);
        translate([0,2,21]) rotate([90,0,0]) cylinder(d1=18,d2=0,h=9, center=true);
       translate([0,-2,21]) rotate([-90,0,0]) cylinder(d1=18,d2=0,h=9, center=true);
        translate([0,0,32]) cylinder(d=4,h=10, center=true);
    }
}

cube([72,44,6], center=true);
translate([-17,0,0]) holder();
translate([+17,0,0]) holder();
