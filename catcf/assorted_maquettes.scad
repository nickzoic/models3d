$fn=100;

scale([1/50,1/50,1/50]) {

cylinder(h=1510,d=265);

for (x=[0:610:1500])
translate([x,500,0]) 
intersection() {
    cylinder(h=800,d=600);
    scale([1,1,2]) translate([0,0,200]) sphere(d=600);
}

translate([1000,-1000,0]) cylinder(d=2100,h=110);
translate([-1200,-1000,0]) cylinder(d=2100,h=110);

translate([600,2400,0]) cylinder(d=1270,h=180);

translate([0,1000,0]) difference() {
    cube([1120,650,745]);
    translate([50,50,50]) cube([1020,601,696]);
}

translate([-1200,600,0]) difference() {
    union() {
        cylinder(h=1800,d=1000);
        translate([0,0,1800]) sphere(d=1000);
    }
    cylinder(h=1800,d=950);
    translate([0,0,1800]) sphere(d=950);
    translate([0,500,1300]) cube([600,1000,800],center=true);
}

for (x=[-100,-420]) {
translate([x,1000,0]) rotate([0,-90,0]) intersection() {
    cylinder(d=3620,h=295);
    cube(3620);
}
}
}