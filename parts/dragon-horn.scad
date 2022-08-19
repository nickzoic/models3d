a = 55;
p = 0.6;
h = 250;
r = 25;
s = 1;
$fn=50;

w = 25;
t = 1.5;

a2 = 0;
z2 = 0;

rotate([0,0,90]) difference() {
    rotate([0,a,0])
        translate([0,0,-h/2])
            for (y=[0:s:h]) {
                r1 = pow((h+s-y)/h, p)*r;
                r2 = pow((h-y)/h, p)*r;
                translate([0,0,y])
                    cylinder(s, r1, r2);
            }
    translate([0,0,t*1.5])
        cube([w,1000,t],center=true);
    translate([0,0,-500])
        cube(1000, center=true);
    cylinder(h=2,d1=6,d2=2.5);
    cylinder(h=12,d=2.5);
    translate([0,0,12]) cylinder(h=2.5,d1=2,d2=0);
}
