 
module goose() {
    translate([-125,-90,0]) import("white.stl");
}

difference() {
    
    intersection() {
        translate([0,0,30]) cube([100,100,60],center=true);
        goose();
    }
    
    translate([1.5,-13,22]) union() {
        cylinder(d=18,h=100);
        sphere(d=18);
    }
}