/*
   Multi-material keyrings
   
   License: CC-0 No Rights Reserved
   https://creativecommons.org/share-your-work/public-domain/cc0/
*/

$fn = 32;

names = ["JORGIE", "AMELIA", "CARA"];

size = 14;
font = "Impact";
scale = 1.5;
space = size*2;
offset = size/3;
soft = 1;

module texts() {
    for (i=[0:len(names)-1]) {
        translate([offset,i*space,0.5])
        linear_extrude(2.5) text(names[i], size=size,font=font,valign="center");
    }
}

module outline() {
    for (i=[0:len(names)-1]) {
        translate([offset,i*space,0.5])
        linear_extrude(2)
            fill() offset(1) text(names[i], size=size,font=font,valign="center");
    }
}
            
module surround() {
  minkowski() {
    for (i=[0:len(names)-1]) {
        difference() {
            linear_extrude(1) {
                hull() {
                    translate([0,i*space]) circle(r=6);
                    translate([offset,i*space]) offset(2.5) text(names[i], size=size,font=font,valign="center");
                }
            }
            translate([0,i*space,-1]) cylinder(d=8,h=6);
        }
    }
    sphere(r=soft);
  }
}
    
module outlinex() {
difference() {
outline();
texts();
}
}

module surroundx() {
difference() {
surround();
outline();
}
}

material = 0;
if (material == 0) {
    color("white") texts();
    color("black") outlinex();
    color("blue") surroundx();
} else if (material == 1) {
    texts();
} else if (material == 2) {
    outlinex();
} else if (material == 3) {
    surroundx();
}