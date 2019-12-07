angle=60;

id = 147;
od = 162;
hh = 4;
wt = 2;
tt = 0.75;

for (x = [0:5]) {
        
    translate([12*x,10*x,0]) difference() {
        union() {
            rotate_extrude(angle=angle, $fn=200) {
                polygon(points=[[id/2-wt,0],[od/2+wt,0],[od/2+wt,hh+wt],[id/2-wt,hh+wt]]);
                translate([(id+od)/4,hh+wt]) circle(d=(od-id)/2+wt*2);
            }
            for (a=[6:12:angle]) {
                rotate([0,0,a]) {
                    translate([(id+od)/4,0,7.5]) {
                        cylinder(d1=(od-id)/2+wt*2-1,d2=1,h=20, $fn=32);
                        translate([0,0,18]) sphere(d=8, $fn=16);
                    }
                }
            }
        }
        union() {
            rotate_extrude(angle=360, $fn=200) {
                polygon(points=[[id/2,wt],[od/2,wt],[od/2,hh+wt*2],[id/2,hh+wt*2]]);
                intersection() {
                    translate([(id+od)/4,hh+wt]) circle(d=(od-id)/2+wt*2-tt*2);
                    polygon(points=[[id/2-wt,hh+wt],[(id+od)/4,wt],[od/2+wt,hh+wt],[od/2+wt,hh+wt+od],[id/2-wt,hh+wt+od]]);
                }
            }
            for (a=[6:12:angle]) {
                rotate([0,0,a]) {
                    translate([(id+od)/4,0,7.5]) {
                        cylinder(d1=(od-id)/2+wt*2-tt*2-1,d2=0,h=19, $fn=32);
                        translate([0,0,18]) sphere(d=8-tt*2, $fn=16);
                    }
                    translate([(id+od)/4,0,0]) cube([(od-id)/2,(od-id)/2,(wt+tt)*2], center=true);
                }
            }
        }
    }   
}