include <../saturnalia/gears.scad>;

// 43:27--22:48 should give a 0.73 reduction
// just right to keep lenses in focus at least mostly.

// constraints:
// 40<=a<c<60
// 20<=d<b<30
// a+b = c+d 
// a*d/b/c ~= 0.73

// 0.729938 70 (white)
/*a = 43;
b = 27;
c = 48;
d = 22;*/

// 0.733333 64 (red)
/*a = 44;
b = 20;
c = 48;
d = 16;*/

// 0.7208237986270022 61 (red/green)
/*a = 42;
b = 19;
c = 46;
d = 15;*/

// 0.7406 64 (blue)
a = 43;
b = 21;
c = 47;
d = 17;

x = 10;   // connection between shaft and gear d
y = 12;   // bearing shaft
z = 3.75;    // inside shaft

module lens_gear(teeth) {
    difference() {
        spur_gear(1, teeth, 10, 10, optimized=false);
        translate([0,0,-1]) cylinder(d=36.25,h=12);
        cylinder(d1=38,d2=36,h=1);
        translate([0,0,9]) cylinder(d1=36,d2=38,h=1);
    }    
}

lens_gear(a);
difference() {
    spur_gear(1, d, 10, x, optimized=false);
    cylinder(d1=x+1,d2=x,h=1);
}

translate([(a+c)/2+4,0,0]) {
    lens_gear(c);
    difference() {
        union() {
            spur_gear(1, b, 10, 0, optimized=false);
            cylinder(h=26,d=y);
            //translate([-4,-4,26]) cube(8);
            cylinder(h=35,d=x);
            translate([0,0,35]) cylinder(h=1,d1=x,d2=x-1);
        }
        cylinder(h=36,d=3.75);
    }
}



