// Coronation Orb, for Frozen The Musical.
// By Nick.

$fn=50;
d1=100;
d2=25;

difference() {
union() {

// main body
sphere(d=d1, $fn=250);

// circumferential band
rotate_extrude($fn=100) translate([d1/2-1,0,0]) circle(d=5);

/*
// bottom band
!translate([0,0,-d1/2+7]) {
 rotate_extrude($fn=100) translate([25,0]) circle(d=5);
    cylinder(d=50,h=5,center=true);
    }
*/

// double vertical band
for (x=[-1,1]) {
translate([x*10,0,0])
rotate([0,90,0])
rotate_extrude($fn=100) translate([d1/2-2,0,0]) circle(d=5);
}

// circles around rhinestones
for (a=[0:3]) rotate([0,0,a*90])
translate([d1/2-2,0,0])
rotate([0,90,0])
rotate_extrude() translate([d2/2+1.5,0,0]) circle(d=5);


// assorted stars
stars = [
[45,50,0.7],
[20,45,0.8],
[42,0,1],
[40,-30,0.8],
[15,-40,0.7],
[30,-50,0.8],
];

for (j = [0,180]) {
for (k = [0,180]) {
for (x = stars) {
rotate([j,0,0])
    rotate([0,x[0],x[1]+k])
translate([d1/2-1,0,0]) rotate([90,0,90]) scale(x[2]) star();

}
}
}

}

// cutouts for rhinestones
for (a=[0:3]) rotate([0,0,a*90]) 
translate([d1/2-2,0,0]) rotate([0,90,0]) cylinder(d=d2,h=10);

// cutout on base
translate([0,0,-d1/2-5]) cylinder(d=d1,h=10);
}

// beads around the top6
for (a=[0:19]) rotate([0,0,a*360/20])
translate([0,d1/4.5,d1/2-2]) sphere(d=10);

translate([0,0,d1/2-2]) cylinder(r=d1/4.5,h=7, center=true);

module star() {
    a=7; b=2; c=1; d=4; e=10;
    minkowski() {
    sphere(d=1, $fn=32);
    linear_extrude(1)
    polygon([
        [a,0],[b,c],[d,d],[c,b],
        [0,e],[-c,b],[-d,d],[-b,c],
        [-a,0],[-b,-c],[-d,-d],[-c,-b],
        [0,-e],[c,-b],[d,-d],[b,-c],
    ]);
    }
}

// 35/(y+2)+30/(29-y)+2;
    
function stem_func(y) = y^2 * 16 + 5;
    
// stem

translate([0,0,d1/2+1.5])
rotate_extrude()
polygon(concat(
   [ [ 0, 0 ] ],
   [ for (y=[0:29]) [ stem_func(y/16-1), y ] ],
   [ [ 0, 20 ] ],
 ));

 // flower
 translate([0,0,d1/2+50])
 intersection() {
 for (a=[0:4])
 rotate([0,45,a*72])
 rotate([0,0,-25])
 rotate_extrude(angle=50)
 polygon([
  [0,-30],
  [40,-30],
  [40,30],
  [0,30]
  ]);
  difference() {
    sphere(d=50, $fn=100);
  translate([0,0,2]) sphere(d=46, $fn=100);
  }
  }
 
