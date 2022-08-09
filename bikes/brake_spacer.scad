$fn = 100;

w = 29;     // width of rectangle
h = 15.65;  // height of rectangle
t = 4;      // thickness
            // standard is 10.
d = h+3.8;  // diameter of piston circle 
l = 31.7;   // overall length
p = 6.4;    // prong width
x = 4;      // pin hole
y = 28.7;   // pin hole posn
c = 2;      // corner radius

for (t=[3,4,5,6]) {
  for (n=[0,1]) {
    translate([(t-3)*19,t%2*17,0]) rotate([0,0,t%2*180]) {
        difference() {
            union() {
                hull() {
                    translate([+w/2-c,+h/2-c,0]) cylinder(h=t, r=c);
                    translate([+w/2-c,-h/2+c,0]) cylinder(h=t, r=c);
                    translate([-w/2+c,+h/2-c,0]) cylinder(h=t, r=c);
                    translate([-w/2+c,-h/2+c,0]) cylinder(h=t, r=c);
                }
                cylinder(h=t,d=d);
                difference() {
                    translate([-p/2,0,0]) cube([p,l-d/2,t]);
                    translate([0,y-d/2,-1]) cylinder(h=t+2,d=x);
                }
            }
            translate([0,0,t-0.5]) linear_extrude(1) {
                text(str(t), size=d/2, halign="center", valign="center");    
            }
        }
    }
  }
}