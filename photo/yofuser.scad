$fn=100;

// didn't actually measure this yet
fx = 50;
fy = 25;

d1 = 40;  // inner cutout
d2 = 66;  // inner sleeve
d3 = 83;  // outer large ring
d4 = 78;  // outer snap diameter
d5 = 90;  // outside diameter

h1 = 2;   // base thickness
h2 = 18;  // inner height
h3 = 20;  // outer height
h4 = 14;  // snap height

st = 2.5;  // snap thickness
bv = 2.5;  // bevel

difference() {
  rotate_extrude() {
    polygon(points=[
        [d2/2,0],
        [d5/2,0],    
        [d5/2,h3],
        [d3/2,h3],
        [d3/2,18],
        [d4/2,15.5],
        [d4/2,13],
        [d3/2,10.5],
        [d3/2,h1],
        [d2/2,h1],
        [d2/2,h2-bv],
        [30.5,h2],
        [d1/2,h2],
        [d1/2,0],
    ]);
  }
  cube([fx,fy,100], center=true);
}  
