$fn=200;

d1 = 135;
d2 = 150;
d3 = 25;
d4 = 100;
r = 2.5;
h1 = 10;
h2 = 60;
k=22/7;

intersection() {
  difference() {
    union() {
        cylinder(d1=d1-2,d2=d1,h=h1);
        translate([0,0,h1]) cylinder(d=d2-r,h=h1);            
        rotate_extrude() {
            polygon( concat(
                [ [ 0, h1 ] ],
                [ for (y=[0:h2-h1]) [ (d2-r)/2*((h2-y)/h2)^k, y+2*h1 ] ],
                [ [ 0, h2 ] ],
            ));
            hull() {
            translate([d2/2-r/2,h1+r]) circle(r=r);
            translate([d2/2-r/2,2*h1]) circle(r=r);
            }
        }
        translate([0,0,h2+(2*h1)-d3+r]) sphere(d=d3);
    
    }
    translate([0,0,-0.1]) cylinder(d1=d4,d2=0,h=h2*2/3);
  }
  
  
  // test
  //cube([10,200,400], center=true);
}
