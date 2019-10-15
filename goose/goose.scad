 
module goose() {
    //scale([1.666,1.666,1.666 ])
    translate([-125,-90,0]) import("white.stl");
}

$fn=64;

rotate([0,8,0]) translate([-6,72,-22]) rotate([-67.25,0,186]) union () {
    difference() {
        translate([1.5,-13,48]) cylinder(d1=17,d2=18,h=0);
        translate([1.5,-13,48]) cylinder(d1=14,d2=12,h=20);
    
    }
    intersection() {
        translate([0,0,100]) cube([200,200,60], center=true);
        goose();
    }
}

