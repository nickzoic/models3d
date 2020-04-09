$fn=100;

difference() {
    cylinder(d=110,h=80);
    translate([0,0,3]) cylinder(d=105,h=80);
    translate([0,0,-1]) cylinder(d=85,h=100);
    translate([20,-60,3]) {
        cube([120,120,120]);
        rotate([0,-45,0]) cube([120,120,120]);
    };
    translate([50,0,0]) cube([100,1,10],center=true);
}