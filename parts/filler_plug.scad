$fn=100;

difference() {
union() {
    for (a=[0:2]) {
        translate([0,0,2*a]) cylinder(d1=20,d2=21.5,h=1);
        translate([0,0,2*a+1]) cylinder(d1=21.5,d2=20,h=1);
    }
     translate([0,0,7]) cylinder(d1=20,d2=24,h=2);
    translate([0,0,9]) cylinder(d1=24,d2=20,h=2);   
    
    cylinder(d=20,h=19);
    translate([0,0,17]) cylinder(d1=20,d2=24,h=2);
    translate([0,0,19]) cylinder(d1=24,d2=20,h=2);
    translate([0,0,0]) cylinder(d=5.2,h=29);
    translate([0,0,29]) cylinder(d1=5.2,d2=4,h=1);
}
translate([0,0,20])
linear_extrude(2) text("v  5", valign="center", halign="center", size=8);

translate([0,0,-1]) {
    cylinder(d=2.5,h=35);
    cylinder(d1=10,d2=2,h=10);
 }
}
