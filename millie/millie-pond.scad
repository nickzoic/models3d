module pond(x) {
    difference() {
        union() {
            cylinder(d=100-x,h=4);
            translate([20,28,0]) cylinder(d=70-x,h=4);
            translate([20,-20,0]) cylinder(d=80-x,h=4);
        }
        translate([80,0,-1]) cylinder(d=100+x,h=6);
    }
}

difference() {
    pond(0);
    translate([0,0,3]) pond(4);
    translate([0,0,2]) pond(10);
}