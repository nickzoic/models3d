$fn=100;

    
difference() {
    cylinder(d=24,h=45);
    cylinder(d1=19.5, d2=11.5, h=24.5);
    translate([0,0,26]) cylinder(d=13.5,h=19);
    translate([0,0,43]) cylinder(d1=13.5,d2=16.5,h=2);
    cylinder(d=10,h=45);
    cube(100);
    rotate_extrude() {
        translate([13.5,20]) circle(d=4);
        translate([13,25]) circle(d=4);
        translate([13.5,30]) circle(d=4);
    }
}