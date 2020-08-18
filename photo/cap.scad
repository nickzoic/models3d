$fn=100;

d1 = 54;
h1 = 13;

tt = 1.5;
aa = 30;

cylinder(d1=d1,d2=d1+2*tt,h=tt);
    
translate([0,0,tt]) {
    difference() {
        union() {
            cylinder(d=d1+2*tt,h=h1-tt);
            intersection() {
                for (a = [0:aa:360]) {
                    rotate([0,0,a]) {
                        translate([d1/2+tt,0,(h1-tt)/2]) {
                            rotate([0,0,45]) {
                                cube([tt,tt,h1-tt], center=true);
                            }
                        }
                    }
                }
                union() {
                    cylinder(d1=d1+2*tt,d2=d1+4*tt,h=tt);
                    translate([0,0,tt]) cylinder(d=d1+4*tt,h=h1-3*tt);
                    translate([0,0,h1-2*tt]) cylinder(d1=d1+4*tt,d2=d1+2*tt,h=tt);
                }
            }
        }
        cylinder(d=d1,h=h1);
        translate([0,0,h1-2*tt]) cylinder(d1=d1,d2=d1+2*tt,h=tt);
        for (a = [0:aa:360]) {
            rotate([0,0,a]) {
                translate([d1/2,0,h1/2]) {
                    rotate([0,0,45]) {
                        cube([tt/2,tt/2,h1], center=true);
                    }
                }
            }
        }
    }
}
