$fn=100;

// didn't actually measure this yet
fx = 61;
fy = 34.5;
fr = 1;  // corner radius

d1 = 45;  // inner cutout
d2 = 72;  // inner sleeve
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
  hull() {
      for (x = [-fx/2+fr,+fx/2-fr]) {
          for (y = [-fy/2+fr,+fy/2-fr]) {
              translate([x,y,0]) cylinder(d=fr*2,h=100,center=true);
          }
      }
  }   
}  
