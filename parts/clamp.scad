$fn=20;

od = 65;
sl = 40;
sh = 18;
sw = 2.5;
hh = 9;
hd = 4;

difference() {
    scale([0.5,1,0.8]) sphere(d=od, $fn=100);
    translate([0,0,-od/2]) cube([od,od,od], center=true);
    hull() {
        for (y = [-sl/2,sl/2]) {
            for (z = [-10,sh]) {
                translate([0,y,z]) sphere(d=sw);
            }
        }
    }
    for (y=[-6,0,6]) {
        translate([0,y,hh]) rotate([90,90,90]) cylinder(d=hd, h=od, center=true);
        /*
        for (x = [-5,-4,-3,-2,-1,1,2,3,4,5]) {
            translate([od*x/24,y,1]) cylinder(d=0.5,h=hh-hd/2-2);
        }
        */
    }
}

