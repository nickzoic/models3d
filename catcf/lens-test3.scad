// printed in PLA, 0.15mm layers,
// 3 walls, 4 top & bottom, 50% cubic sub infill
// no support necessary.
$fn=60;

for(x=[0,65]) translate([x,0,0])
difference() {
    cylinder(d=62,h=8,$fn=100);
    for(a=[0:10:359]) rotate([0,0,a]) translate([31,0,-1]) cylinder(d=1,h=10,$fn=4);
    for(a=[5:10:359]) rotate([0,0,a]) translate([31,0,-1]) cylinder(d=1,h=6,$fn=4);
    for(a=[2.5:5:359]) rotate([0,0,a]) translate([31,0,-1]) cylinder(d=1,h=4,$fn=4);
    
    for(a=[0:10:200]) rotate([0,0,-a]) translate([0,25,7]) linear_extrude(2) text(str(a/10%10),size=5,halign="center");
    
    translate([0,0,-1]) cylinder(d=36.25,h=12);
    translate([0,0,4]) rotate([-90,0,0]) cylinder(d=2,h=26);
    translate([0,0,4]) rotate([-90,0,0]) translate([0,0,20]) cylinder(d1=2,d2=4,h=1);
    translate([0,0,4]) rotate([-90,0,0]) translate([0,0,21]) cylinder(d=4,h=100,$fn=16);
    cylinder(d1=38,d2=36,h=1);
    translate([0,0,7]) cylinder(d1=36,d2=38,h=1);
}


translate([30,60,0]) {
difference() {
    union() {
        cylinder(h=60,d=65);
        translate([-32.5,0,0]) cube([65,34,5]);
        
    }
    translate([0,0,-1]) cylinder(d=36.25,h=12);
    translate([0,0,5]) cylinder(d=63,h=60);
   rotate([0,0,-60]) translate([-50,0,5]) cube(100);
    rotate([0,0,90]) translate([-50,0,5]) cube(100);
}
translate([-32.5,31,0]) cube([65,3,8]);
}