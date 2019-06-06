$fn=40;

e = "BLN-1"; // engraving
l = 49; // battery length
w = 34; // battery width
h = 15; // battery height
n = 3; // number of batteries
t = 3; // thickness of walls
f = 23; // finger cutout size
x = 2; // size of eject hole

difference() {
    minkowski() {
        cube([l,(w+t)*n-t,h]);
        sphere(r=t);
    }

    for (i = [0:n-1]) {
        translate([0,(w+t)*i,0]) {
            cube([l+t*2,w,h]);
        }
        if (x>0) {
            translate([-t,(w+t)*i+w/2,h/2])
            rotate([0,90,0])
                cylinder(d=x,h=t*3,center=true);
        }
        if (w > f) {
            translate([l+t,(w+t)*i+w/2,h/2])
                cylinder(d=f, h=h+t*4, center=true);
        }
    }
    if (h>f) {
        translate([l+t,(w+t)*n/2,h/2]) rotate([90,0,0]) cylinder(d=f, h=(w+t)*n+3*t, center=true);
    }
    if (e) {
        translate([t,t,-t+1]) rotate([180,0,90])
           linear_extrude(t) text(e, font="Comfortaa:style=Regular");
    
    }
}