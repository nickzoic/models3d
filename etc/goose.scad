 
module goose() {
    scale([1.666,1.666,1.666 ]) translate([-125,-90,0]) import("white.stl");
}

$fn=64;

intersection() {
    translate([0,0,50]) cube([120,135,100],center=true);
    difference() {
        translate([-12,-15,0]) goose();
        translate([-9.5, -36.5, 30]) union() {
            cylinder(d=30,h=100);
            sphere(d=30);
        }
    }
}

translate([22,120,-44]) rotate([-64,0,190]) union () {
    translate([2.5,-21.5,90]) cylinder(d=29,h=10);
    
    intersection() {
        translate([0,0,150]) cube([200,200,100], center=true);
        goose();
    }
}
    

