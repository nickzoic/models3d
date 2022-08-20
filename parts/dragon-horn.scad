// Dragon horn which slides onto a 
// kid's headband.

// Printed in PLA with 0.15mm layer
// 3 wall line count
// 4 top layers
// 8 bottom layers so the little bridge bit is solid all the way through
// infill 10% gyroid
// support (lines) 50⁰
// no adhesion necessary


a = 55;
p = 0.5;
h = 200;
r = 23;
s = 1;
$fn=50;

w = 30;
t = 3.5;

a2 = 0;
z2 = 0;

rotate([0,0,90]) difference() {
    rotate([0,a,0])
        translate([0,0,-h/2])
            for (y=[0:s:h]) {
                r1 = pow((h+s-y)/h, p)*r;
                r2 = pow((h-y)/h, p)*r;
                translate([0,0,y])
                    cylinder(s, r1, max(r2, s/3));
            }
    translate([0,0,t])
        cube([w,1000,t],center=true);
    cylinder(h=t*1.5,d=w*3/4);
    translate([0,0,-500])
        cube(1000, center=true);
    cylinder(h=2,d1=6,d2=2.5);
    cylinder(h=12,d=2.5);
    translate([0,0,12]) cylinder(h=2.5,d1=2,d2=0);
}
