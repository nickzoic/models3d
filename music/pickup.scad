// pickup dimensions (approx)

pdd = 0.702 * 25.4 + 2;
px1 = 2.409 * 25.4 + 1;
px2 = 3.472 * 25.4;

// plate dimensions

d1 = 107;
t1 = 1;
t2 = 2;
sd1 = 3.5;

sd2 = 3;
sd3 = 5;

pa = -30;
yo = 10;

$fn = 100;

intersection() {
    difference() {
        union() {
            cylinder(h=t1,d=d1);
            translate([0,0,1]) cylinder(h=t2,d1=d1,d2=d1-t2*2);
        }
        rotate([0,0,pa]) {
            hull() {
                translate([-px1/2,0,-1]) cylinder(d=pdd, h=20);
                translate([+px1/2,0,-1]) cylinder(d=pdd, h=20);
            }
            translate([-px2/2,0,-1]) cylinder(d=sd1,h=20);
            translate([+px2/2,0,-1]) cylinder(d=sd1,h=20);
        }
        
        for (aa = [45,90,150,240,300]) {
            rotate([0,0,pa+aa]) union() {
                translate([px2/2,0,t1+t2-sd3/2]) cylinder(d1=0,d2=sd3,h=sd3/2);
                translate([px2/2,0,-1]) cylinder(d=sd2,h=20);
            }
        }
    }
    translate([0,-yo,0]) cube([d1,d1,20], center=true);
}