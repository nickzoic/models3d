$fn=100;

module screw(d,h) {
    translate([0,0,-d/2]) cylinder(d=d,h=h-d,center=true);
    translate([0,0,h/2-d/2]) cylinder(d1=d,d2=3*d,h=d,center=true);
    translate([0,0,h/2+d]) cylinder(d=3*d,h=2*d,center=true);
}

intersection() {
    cube([100,100,50], center=true);
    difference() {
        union() {
            linear_extrude(100, center=true) {
                hull() {
                    translate([9,0,0]) circle(d=34);
                    translate([-9,0,0]) circle(d=25);
                }
            }
            rotate([0,17,0]) cylinder(d=32,h=100,center=true);
           
        }
        rotate([0,17,0]) cylinder(d=27.5, h=100, center=true);
        translate([50,0,0]) cube([100,2,100], center=true);
        translate([12.5,0,-17.5]) rotate([90,0,0]) screw(3,30);
        translate([-15,0,12]) rotate([90,0,0]) linear_extrude(100, center=true) hull() { translate([0,-7,0]) circle(d=4); translate([0,7,0]) circle(d=4); };
        //cube([3,100,15],center=true);
    }
}
