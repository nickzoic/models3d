$fn=100;
cylinder(h=5,d=34.7);
translate([0,0,5]) cylinder(h=5,d1=34.7,d2=10);
translate([0,0,50]) sphere(d=25);
linear_extrude(50, twist=180) circle($fn=5,d=15);
