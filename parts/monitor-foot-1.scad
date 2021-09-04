$fn=200;
height = 60;

difference() {
    //cylinder(d=50,h=height);
    linear_extrude(height,twist=90) {
        union() {
            rotate([0,0,22.5]) square(50,center=true);
            rotate([0,0,-22.5]) square(50, center=true);
        }
    }
    #hull () {
        translate([-35,0,height-20]) cylinder(d=13,h=12);
        translate([15,0,height-20]) cylinder(d=10,h=12);
    }
    cylinder(h=height-10,d1=40,d2=6);
}


