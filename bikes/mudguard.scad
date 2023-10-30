$fn=100;

fd = 390; // diameter under fork
fw = 55;  // width of fork arch
tt = 2.5;  // thickness

intersection() {
    translate([0,0,-fd]) rotate([0,-90,0]) rotate([0,0,-45]) rotate_extrude(angle = 90, $fn=400) {
        translate([fd,0,0]) {
            difference() {
                circle(d=fw);
                circle(d=fw-tt*2);
                translate([-fw/2,0,0]) square(fw, center=true);
            }
        }
    }
    translate([0,0,115]) sphere(d=230);
    cube([120,135,100],center=true);
}
difference() {
    translate([0,0,fw/2-tt]) cylinder(h=25,d=10);
    translate([0,0,fw/2-tt+10]) rotate([90,0,0]) cylinder(h=20,d=5,center=true);
}