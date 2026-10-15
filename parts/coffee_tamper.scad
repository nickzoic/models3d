$fn=100;
d1 = 35;
d2 = 20;
hh = 50;
tt = 5;
gg = 1;

cylinder(h=tt,d=d1);
translate([0,0,tt]) cylinder(h=tt,d1=d1,d2=d2/1.5);
translate([0,0,hh]) {
    difference() {
        sphere(d=d1);
        for (r = [0:72:359])
        rotate([0,45,r]) rotate_extrude() {
            translate([d1/2,0]) circle(d=gg);
        }
    
        
    }
}
linear_extrude(50, twist=180) circle($fn=5,d=d2);
