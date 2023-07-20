// An aperiodic monotile cookie cutter
// See https://cs.uwaterloo.ca/~csk/hat/

// width of cutter in mm
width = 80;

// height of cutter in mm
height = 16;

// nozzle diameter in mm (approx)
nozzle = 0.4;

$fn = 32;

/* [Hidden] */

points=[
    [0,0],
    [-1.5,-0.8660254037844386],
    [-1,-1.7320508075688772],
    [1,-1.7320508075688772],
    [1.5,-0.8660254037844386],
    [3,-1.7320508075688772],
    [4.5,-0.8660254037844386],
    [4,0],
    [3,0],
    [3,1.7320508075688772],
    [1.5,2.598076211353316],
    [1,1.7320508075688772],
    [0,1.7320508075688772]
  ];


module cutter() {
    for (n = [0 : len(points)-1]) {
        p1 = points[n] * width / 6;
        p2 = points[(n+1)%len(points)] * width / 6;
        
        hull() {
          translate(p1) cylinder(h=height,d1=1.5,d2=nozzle);
          translate(p2) cylinder(h=height,d1=1.5,d2=nozzle);
        }
        hull() {
          translate(p1) cylinder(h=2,d1=5,d2=3);
          translate(p2) cylinder(h=2,d1=5,d2=3);
        }        
    }
}

cutter();

// reflected version to save you flipping
// the dough ...
translate([0,-width/2-20,0]) mirror([1,0,0]) rotate([0,0,180]) cutter();
