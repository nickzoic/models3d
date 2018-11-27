//use <MCAD/involute_gears.scad>

$fn=100;

module my_gear() {
     /*gear(
        number_of_teeth=9,
        circular_pitch=142,
        bore_diameter= 0,
        gear_thickness = 13,
        rim_thickness = 13
    );*/
    cylinder(d=4.75,h=10, center=true);
    for (i = [0:8]) {
        rotate([0,0,i*360/9]) {
            translate([2,0,0]) cube([3,1.5,10], center=true);
            translate([3.5,0,0]) cylinder(d=1.5,h=10, center=true);
    }
    }    
}

translate([0,0,0]) {
difference() {
    union() {
        cylinder(d=15, h=22);
        cylinder(d=20, h=11);
    }
    translate([0,0,17]) my_gear();
}
}

nh = 15;

difference() {
    cylinder(d=118,h=30);
    cylinder(d=10,h=30);
    translate([0,0,10]) cylinder(d=78,h=30);
    
    for (i = [0:4]) {
        rotate([0,0,i*360/5]) translate([24,0,-1]) cylinder(d=26,h=22);
    }
    for (i = [0:nh-1]) {
        rotate([0,0,i*360/nh]) translate([49,0,6]) union() {
            cylinder(d=18.5, h=30);
            sphere(d=18.5);
        }
    }
}