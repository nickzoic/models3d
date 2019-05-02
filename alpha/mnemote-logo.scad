$fn = 16;
s = 10;

module stroke1() {
    linear_extrude(10) {
        hull() {
            translate([-s,-2.5*s,0]) circle(d=s);
            translate([s,2.5*s,0]) circle(d=s);
        }
    }
}

module stroke2() {
    translate([0,0,15]) linear_extrude(10) hull () {
        translate([s,-2.5*s,0]) circle(d=s);
        translate([-s,2.5*s,0]) circle(d=s);
    }
    translate([s,-2.5*s,0]) cylinder(d=s, h=25);
    translate([-s,2.5*s,0]) cylinder(d=s, h=25);
}

module m() {
    translate([0*s,0,0]) stroke1();
    translate([2*s,0,0]) stroke2();
    translate([4*s,0,0]) stroke1();
    translate([6*s,0,0]) stroke2();
}

module n() {
    translate([0*s,4*s,0]) stroke1();
    translate([2*s,4*s,0]) stroke2();
    translate([4*s,4*s,0]) stroke1();
}

difference() {
    minkowski() {
        m();
        intersection() {
            sphere(d=3);
            translate([0,0,1.5]) cube([3,3,3],center=true);
        }
    }
    m();
}

difference() {
    minkowski() {
        n();
        intersection() {
            sphere(d=3);
            translate([0,0,1.5]) cube([3,3,3],center=true);
        }
    }
    n();
}