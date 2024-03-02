$fn=100;

// print in translucent PLA.

// go ahead, mess with these and make
// your own weird looking rock.

pp = [
   [0,-20,15],
   [-12.5,0,15],
   [5,10,10],
   
   [0,20,25],
   [10,0,25],
   [-5,-10,25],
   [10,-12.5,30],
   
   [0,0,40],
   [-7.5,0,40],
   [10,15,35],
   [15,0,30],
   
    [0,-25,55],
   [-17,2,50],
   [15,15,50],
   [10,-15,55],
   
   [0,0,70],
];

difference() {
  union() {
    difference() {
      hull() {
        cylinder(d=41, h=1);
        for (p = pp) {
            translate(p) sphere(7);
        }
      }
      difference() {
          hull() {
            cylinder(d=39, h=1);
            for (p = pp) {
                translate(p) sphere(6.5);
            }
          }
    translate([0,0,4]) rotate([90,0,0])cylinder(d=7,h=46, center=true);
}      
    }
    cylinder(d=41,h=27);
 //   translate([0,0,4]) rotate([90,0,0])cylinder(d=7,h=46, center=true);

  }
  cylinder(d=39, h=25);
  cylinder(d=33, h=28);
  translate([0,0,4]) rotate([90,0,0]) cylinder(d=5,h=100, center=true);

    //cube(100);
}
