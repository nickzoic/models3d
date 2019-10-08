ww = 30;  // width
h1 = 2;  // height of edge
h2 = 5.77; // height of middle
ll = 120; // overall length
cr = 2; // corner radius

rb = 6;  // button cutout radius
wb = 28;  // button cutout width
lb = 43;  // button cutout length

ol = 160;  // outside length
ow = 52;  // outside width

bd = 28; // battery diameter
bx = 64.5; // battery hole posn

// calculate radius of curvature of the top & bottom.
xx = ww/2;
yy = (h2 - h1)/2; 
rr = (pow(xx,2) + pow(yy,2)) / (2*yy);

tt = 1; // tolerance

$fn=200;

module remote() {
    intersection() {
        intersection() {
            translate([0,0,rr-h2/2]) rotate([0,90,0]) cylinder(h=ll, r=rr, center=true);
            translate([0,0,-(rr-h2/2)]) rotate([0,90,0]) cylinder(h=ll, r=rr, center=true);
        };
        translate([0,0,-h2/2]) linear_extrude(h2) {
            hull() {
                translate([-ll/2+cr, -ww/2+cr]) circle(r=cr);
                translate([+ll/2-cr, -ww/2+cr]) circle(r=cr);
                translate([-ll/2+cr, +ww/2-cr]) circle(r=cr);
                translate([+ll/2-cr, +ww/2-cr]) circle(r=cr);
            }
        };
        cube([ll, ww, h2], center=true);
    }
}

module holder() {
    difference() {
        scale([ol/ll, ow/ww, ow/ww]) remote();
        #scale(1.05) translate([ol/2-ll/2*1.05,0,1]) remote();        
        translate([ll/2-lb/2,0,0]) linear_extrude(10) {
            hull() {
            translate([-lb/2+rb,-wb/2+rb,0]) circle(r=rb);
            translate([+lb/2-rb,-wb/2+rb,0]) circle(r=rb);
            translate([-lb/2+rb,+wb/2-rb,0]) circle(r=rb);
            translate([+lb/2-rb,+wb/2-rb,0]) circle(r=rb);
            }
        }
        translate([ol/2-bx,0,-5]) cylinder(d=bd,h=10, center=true);
    }
}

zz = ol/3;


//holder();

intersection() {
    translate([h2/2+1, 0, ol/2]) rotate([180,90,180]) holder();
    //translate([0,0,zz/2]) cube([100,ow,zz], center=true);
}
