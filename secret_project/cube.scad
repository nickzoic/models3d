$fn=64;

for (x = [0:1]) {
    for (y = [0:1]) {
        translate([x*16.5,y*16.5,0]) diffuser();
    }
}
            
module diffuser() {
    difference() {
        union() {
            intersection() {
                cube([16,16,16],center=true);
                rotate([45,45,0]) cube([16,16,16],center=true);
            }
            cylinder(d=14,h=15);
        }
        union() {
            intersection() {
                cube([15,15,15],center=true);
                rotate([45,45,0]) cube([15,15,15],center=true);
            }
            
            cylinder(d=13,h=16);
            
        }
    
    }
    difference() {
        translate([0,0,9]) cylinder(d=13,h=2);
        translate([0,0,10]) cube([10.5,10.5,2],center=true);
        translate([0,0,9]) cylinder(d1=13,d2=11,h=1);
        translate([0,0,10]) cylinder(d1=11,d2=13,h=1);
    }
    
    difference() {
        translate([0,0,6]) cylinder(d=13,h=2);
        
        translate([0,0,6]) cylinder(d1=13,d2=11,h=1);
        translate([0,0,7]) cylinder(d1=11,d2=13,h=1);
    }
}