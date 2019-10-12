 
module goose() {
    scale([1.666,1.666,1.666 ]) translate([-125,-90,0]) import("white.stl");
}

intersection() {
    #translate([0,0,50]) cube([120,135,100],center=true);
    union() {
        translate([-5,-15,0]) goose();
        translate([40,20,-100]) rotate([0,0,180]) goose();
    }
}


