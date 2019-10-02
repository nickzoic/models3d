$fn=32;

od = 15;
sl = 42;
sh = 19;
so = 10;
sw = 2;
hh = 10;
hd = 3;

difference() {
    hull() {
        for (y = [-sl/2,sl/2]) {
            for (x = [0, so]) {
                translate([x,y,0]) sphere(d=od);
            }
            for (z = [0,sh-od/2+sw]) {
                translate([0,y,z]) sphere(d=od);
            }
        }
        
    }
    translate([0,0,-50]) cube([100,100,100], center=true);
    hull() {
        for (y = [-sl/2,sl/2]) {
            for (z = [-10,sh]) {
                translate([0,y,z]) sphere(d=sw);
            }
        }
    }
    union() {
        translate([0,-2*hd,hh]) rotate([90,90,90]) cylinder(d=hd, h=100, center=true);
        translate([0,+2*hd,hh]) rotate([90,90,90]) cylinder(d=hd, h=100, center=true);
    }
}

