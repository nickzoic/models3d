$fn=200;

angle = 23;

difference() {
    union() {
        rotate_extrude(angle=angle) {
            translate([72.5,0,0]) {
                polygon(points=[[0,0],[8.5,0],[8.5,4.5],[0,4.5]]);
                translate([4.25,4.25,0]) circle(d=8.5);
            }
        }
        for (a=[3:12:angle]) {
            rotate([0,0,a]) {
                translate([76.75,0,7.5]) {
                    cylinder(d1=5,d2=1,h=20);
                    translate([0,0,18]) sphere(d=5);
                }
            }
        }
    }
    union() {
        rotate_extrude(angle=angle) {
            translate([72.5,0,0]) {
                polygon(points=[[1,1],[7.5,1],[7.5,3.5],[1,3.5]]);
                translate([4.25,4.25,0]) circle(d=7.5);   
            }
        }
        for (a=[3:12:angle]) {
            rotate([0,0,a]) {
                translate([76.75,0,6]) {
                    cylinder(d1=5,d2=1,h=20);
                    translate([0,0,19.5]) sphere(d=4);
                }
            }
        }
    }
}   