$fn=100;

difference() {
union() {
translate([0,0,25]) sphere(d=50);
cylinder(h=25,d=30);
// circumferential band
for (a=[-1,1]) { 
    translate([0,0,25]) rotate([45*a,0]) rotate_extrude() translate([25,0]) circle(d=5);
    }
        translate([0,0,25]) rotate([90,0,90]) rotate_extrude() translate([25,0]) circle(d=5);
    

}
translate([0,0,-30]) cylinder(d=26,h=65);
translate([0,0,35]) cylinder(d1=26,d2=5,h=10);
}

