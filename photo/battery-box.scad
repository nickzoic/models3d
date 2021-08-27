/* added some info for Thingiverse Customizer */

// dimensions: BLN-1 51 x 36 x 15
//             BLH-1 53 x 45 x 20

// Engraving on side
e = "BLH-1";

// Battery Length + 5mm
l = 58;

// Battery Width + 1mm
w = 46.0;

// Battery Height + 1mm
h = 21.0;

// Number of Batteries
n = 1;

// Thickness of Walls
t = 3;

// Finger cutout size
f = 25;

// Size of eject hole (in case they get stuck)
x = 3;

s = 2;

/* [Hidden] */
$fn=40;

module multihull() {
    for (x = [0:$children-2]) {
        hull() {
            children(x);
            children(x+1);
        }
    }
}

difference() {
    minkowski() {
        cube([l,(w+t)*n-t,h]);
        sphere(r=t);
    }
    
    for (i = [0:n-1]) {
        translate([0,(w+t)*i,0]) {
            difference() {
                cube([l+t*2,w,h]);
                if (s) {
                    translate([l/2-f/4-t/2,(w+t)*i+w/2,h+2.5*s-1]) sphere(d=5*s);
                }
            }
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
        if (s) {
            translate([t,(w+t)*i+w/2,h+t/2]) {
                hull() {
                    translate([t,-3*s,0]) cylinder(d=s, h=t+1, center=true);
                    translate([l-f/2-2*t,-3*s,0]) cylinder(d=s, h=t+1, center=true);
                }
                hull() {
                    translate([l-f/2-2*t,3*s,0]) cylinder(d=s, h=t+1, center=true);
                    translate([t,3*s,0]) cylinder(d=s, h=t+1, center=true);
                }
            }
           
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
