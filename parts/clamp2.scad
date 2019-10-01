$fn=32;

// i forgot the measurements, check out the other one
od = 20;
sl = 42;
sh = 18;
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
            for (z = [0,sh]) {
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
    hull() {
        translate([0,-hd,hh]) rotate([90,90,90]) cylinder(d=hd, h=100, center=true);
        translate([0,+hd,hh]) rotate([90,90,90]) cylinder(d=hd, h=100, center=true);
    }
}

