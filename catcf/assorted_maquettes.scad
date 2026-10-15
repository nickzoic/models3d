$fn=100;

scale([1/50,1/50,1/50]) {

difference() {
    cylinder(h=1510,d=265);
    translate([0,0,50]) cylinder(h=1510,d=165);
}

for (x=[0:610:1500])
translate([x,500,0])
difference() {
    intersection() {
        cylinder(h=800,d=600);
        scale([1,1,2]) translate([0,0,200]) sphere(d=600);
    }
    translate([0,0,50]) cylinder(h=850,d=300);
}

translate([1000,-1000,0]) difference() {
    cylinder(d=2100,h=110);
    translate([0,0,50]) cylinder(d=2000,h=110);
}
translate([-1200,-1000,0]) difference() {
    cylinder(d=2100,h=110);
    translate([0,0,50]) cylinder(d=2000,h=110);
}

translate([2000,1000,0]) difference() {
    cylinder(d=1270,h=180);
    translate([0,0,50]) cylinder(d=1170,h=180);
}

translate([0,1000,0]) difference() {
    cube([1120,650,745]);
    translate([50,50,50]) cube([1020,601,696]);
}

translate([-1200,800,0]) difference() {
    union() {
        cylinder(h=1800,d=1000);
        translate([0,0,1800]) sphere(d=1000);
    }
    cylinder(h=1800,d=950);
    translate([0,0,1800]) sphere(d=950);
    translate([0,500,1300]) cube([600,1000,800],center=true);
}

translate([-600,900,0]) {
    cube([500,500,550]);
    cube([500,100,1000]);
}

for (x=[200,-2000]) {
translate([x,2000,0]) difference() {
    intersection() {
        cylinder(d=3620,h=295);
        cube(3620);
    }
    translate([50,50,50])
    intersection() {
        cylinder(d=3420,h=295);
        cube(3520);
    }
}
}

}
