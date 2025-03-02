$fn=60;

for(a = [0:15:360]) {
    rotate([0,0,a+rands(0,10,1)[0]])
    translate([50,0,0])
    rotate([45,0,0])
    cylinder(d=5,h=130,center=true);
}
    
for(a = [0:15:360]) {
    rotate([0,0,a+rands(0,10,1)[0]])
    translate([50,0,0])
    rotate([-45,0,0])
    cylinder(d=5,h=130,center=true);
}

rotate_extrude() {
translate([66,-45])
    circle(d=10);
translate([66,45])
    circle(d=10);
    
    }
    
translate([0,0,-50])    
cylinder(h=5, d=130);