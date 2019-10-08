d1 = 50;    // out
x1 = 47;    // spacing of holes
d2 = 27.5;    // diameter of insert
d3 = 12;    // diameter of screw lugs
d4 = 4;     // diameter of screw holes
h1 = 8;     // height of insert wall
t1 = 2;   // thickness of outside part
t3 = 1.5;   // thickness of insert wall
t4 = 5;     // thickness of panel

$fn=100;

difference() {
    union() {
        difference() {
            union() {
                cylinder(d=d1,h=t1);
                cylinder(d=d2,h=t1+1.5*t4);
                rotate_extrude() {
                    translate([d2/2-t3/2,t1+t4,0]) circle(r=t3);    
                }
            }
            translate([0,0,-1]) cylinder(d=d2-t3*2,h=t1+1.5*t4+2);
            translate([0,0,-t1/4]) rotate_extrude() {
                translate([d1/2-d3/2,0,0]) circle(d=t1);               
            }
            translate ([0,d2/2+5,t1-0.75]) linear_extrude(1) text("UP", size=(d1-x1)*2, halign="center", valign="center");
            
         
        }
        difference() {
            cylinder(d=d2-t3*2,h=t1+t4+t3);
            for (x=[-7.5:2.5:7.5]) {
                translate([0,t3*x,0]) rotate([-27.5,0,0]) cube([x1,t1,x1], center=true);
            }
           
           
        }
        translate([x1/2,0,0]) cylinder(d=d3,h=t1);
        translate([-x1/2,0,0]) cylinder(d=d3,h=t1);
        
    }
    //translate([0,0,t1]) cylinder(d=d2-2*t3,h=t1+1.5*t4);
    translate([x1/2,0,-1]) cylinder(d=d4,h=t1+2);
    translate([-x1/2,0,-1]) cylinder(d=d4,h=t1+2);
}