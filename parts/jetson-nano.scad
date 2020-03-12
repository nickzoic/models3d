width = 100;
depth = 79;
height = 10;
ho1 = 4;
ho2 = 10;
ho3 = 17;
clr = 1;
thick = 3;
hole = 2.5;

circ = 79;

sclr = 2;

$fn = 20;

difference() {
    cube([width+2*clr+2*thick,depth+2*clr+2*thick,height],center=true);
    translate([0,0,thick]) cube([width+2*clr,depth+2*clr,height],center=true);
    translate([0,-depth/2-thick,thick+sclr]) cube([width,thick*2,height],center=true);
    translate([-width/2+43,depth/2+thick,6]) cube([20,thick*2,height],center=true);
    
    translate([0,0,-height/2+thick-1]) cylinder(h=2, d1=circ-4, d2=circ, center=true);   
}

rotate([0,0,30]) {
    translate([0,22,-height/2+thick-3]) linear_extrude(height=2) text("NVIDIA",halign="center",valign="center",size=11);
    translate([0,12,-height/2+thick-3]) linear_extrude(height=2) text("Jetson Nano",halign="center",valign="center",size=7);
    translate([0,3,-height/2+thick-3]) linear_extrude(height=2) text("DevKit P3450",halign="center",valign="center", size=9);
    translate([0,-7,-height/2+thick-3]) linear_extrude(height=2) text("PCB protection sled",halign="center",valign="center", size=6);
    translate([0,-19,-height/2+thick-3]) linear_extrude(height=2) text("v0.2",halign="center",valign="center",size=15);
    translate([0,-31,-height/2+thick-3]) linear_extrude(height=2) text("@nickzoic",halign="center",valign="center",size=5);
}    

for (x = [-width/2+ho1,width/2-ho2])
    for (y = [-depth/2+ho3,depth/2-ho1]) {
        translate([x,y,-height/2+thick]) cylinder(h=sclr+thick,d1=hole*3, d2=hole*2, center=true);
        translate([x,y,0]) cylinder(h=height,d1=hole, d2=hole*3/4, center=true);
        
    }
    