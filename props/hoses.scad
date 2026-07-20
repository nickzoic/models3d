$fn=100;

difference() {
    union() {
        cylinder(d1=36,d2=40,h=2);
        translate([0,0,2]) cylinder(d=40,h=28);
        translate([0,0,30]) cylinder(d1=40,d2=30,h=10);
    }
    cylinder(d=10,h=25);
    cylinder(d1=32,d2=10,h=19);
    translate([0,0,20]) cylinder(d=13.5,h=25);
    translate([0,0,38]) cylinder(d1=13.5,d2=17.5,h=2);
    
    for (a=[10,20]) 
    rotate_extrude() translate([20,a]) circle(d=2, $fn=12);
    //cube(100);
}

translate([50,0,0]) {
    difference() {
        union() {
            cylinder(d1=20,d2=24,h=2);
            translate([0,0,2]) cylinder(d=24,h=18);
            translate([0,0,20]) cylinder(d1=19.2,d2=18.8,h=7);
        }
        cylinder(d=10,h=50);
        cylinder(d=13.5,h=15);
        translate([0,0,12]) cylinder(d1=10,d2=17.8,h=15);
    }
}