$fn=100;

difference() {
union() {
    cylinder(d1=20,d2=21,h=1);
    translate([0,0,1]) cylinder(d1=21,d2=20,h=1);
    
    difference() {
        union() {
            cylinder(d=20,h=10);
            translate([0,0,7]) cylinder(d1=20,d2=24,h=2);
            translate([0,0,9]) cylinder(d1=24,d2=22,h=1);
        }
        cylinder(d=16,h=11);
    }
    cylinder(d=4,h=10);
    translate([0,0,10]) cylinder(d1=4,d2=3,h=1);
}
translate([0,0,-1]) {
    cylinder(d=2,h=20);
    cylinder(d1=4,d2=2,h=2);
    linear_extrude(2) rotate([180]) text("v 1", valign="center", halign="center", size=8);
}
}