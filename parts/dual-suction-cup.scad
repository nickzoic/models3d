d1 = 12;
d2 = 9;
d3 = 10;
s = 75;
t = 3;
x = 10;

$fn=100;

difference() {
    cylinder(d=s+d1*2,h=t);
    for (a=[-s/2,s/2])
        translate([a,0,-1]) { 
            translate([0,-d2,0]) cylinder(d=d1, h=t+2);
            hull() {
                cylinder(d=d2,h=t+2);
                translate([0,-d2,0]) cylinder(d=d2,h=t+2);
            }
        }
    translate([0,-s/2,-1]) cylinder(d=d3,h=t+2);
    translate([0,0,-1]) cylinder(d=s-d1*2,h=t+2);
}
translate([0,s/2,0]) cylinder(d=d1*2,h=x+t);

/*for (a=[-s/2,s/2])
    translate([a,0,x+t])
        cylinder(h=1,d=s);    
*/
