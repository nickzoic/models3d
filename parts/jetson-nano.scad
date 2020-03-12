width = 100;
depth = 79;
height = 10;
ho1 = 4;
ho2 = 10;
ho3 = 17;
clr = 2.5;
thick = 3;
hole = 2.75;

sclr = 2;

$fn = 20;

difference() {
    cube([width+2*clr+2*thick,depth+2*clr+2*thick,height],center=true);
    translate([0,0,thick]) cube([width+2*clr,depth+2*clr,height],center=true);
    translate([0,-depth/2-thick,thick+sclr]) cube([width,thick*2,height],center=true);
    translate([-width/2+43,depth/2+thick,6]) cube([16,thick*2,height],center=true);
    translate([0,30,-height/2+thick-1]) linear_extrude(height=2) text("Jetson Nano",halign="center",valign="center");
    translate([0,10,-height/2+thick-1]) linear_extrude(height=2) text("Devkit Sled",halign="center",valign="center");
    translate([0,-10,-height/2+thick-1]) linear_extrude(height=2) text("nick.zoic.org",halign="center",valign="center");
    translate([0,-30,-height/2+thick-1]) linear_extrude(height=2) text("v0.1",halign="center",valign="center");
}

for (x = [-width/2+ho1,width/2-ho2])
    for (y = [-depth/2+ho3,depth/2-ho1]) {
        translate([x,y,-height/2+thick+sclr/2]) cylinder(h=sclr,d=hole*2, center=true);
        translate([x,y,0]) cylinder(h=height,d=hole, center=true);
        
    }
    