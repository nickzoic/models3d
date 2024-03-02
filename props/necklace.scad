$fn=100;

// print in translucent PLA.

// go ahead, mess with these and make
// your own weird looking rock.

pp = [
   [0,-20,15],
   [-20,0,15],
   [10,10,10],
   
   [0,20,25],
   [15,0,25],
   [-10,-10,25],
   [15,-12.5,30],
   
   [0,0,40],
   [-20,0,40],
   [15,15,35],
   
    [0,-25,55],
   [-15,5,55],
   [15,15,50],
   [15,-15,55],
   
   [0,0,70],
];

   

difference() {
    cylinder(d=41,h=27);
    cylinder(d=39,h=25);
    cylinder(d=33,h=28);
    translate([0,0,3]) rotate([90,0,0]) cylinder(d=4,h=100, center=true);
    translate([0,0,3]) rotate([0,90,0]) cylinder(d=4,h=100, center=true);
}
difference() {
    hull() {
        cylinder(d=41, h=1);
        for (p = pp) {
            translate(p) sphere(10);
        }
    }
    hull() {
        for (p = pp) {
            translate(p) sphere(9);
        }
    }
    cylinder(d=39, h=25);
translate([0,0,3]) rotate([90,0,0]) cylinder(d=4,h=100, center=true);
translate([0,0,3]) rotate([0,90,0]) cylinder(d=4,h=100, center=true);

    //cube(100);
}
