/*
   Multi-material keyrings
   
   License: CC-0 No Rights Reserved
   https://creativecommons.org/share-your-work/public-domain/cc0/
*/

$fn = 32;

names = ["Jorgie", "Amelia"];

offsets = [
    [ 2, 2 ],  // A
    [ 0, 0 ],  // B
    [ 0, 0 ],  // C
    [ 0, 0 ],  // D
    [ 0, 0 ],  // E
    [ 0, 0 ],  // F
    [ 0, 0 ],  // G
    [ 0, 0 ],  // H
    [ 0, 0 ],  // I
    [ 1, 2 ],  // J
    [ 0, 0 ],  // K
    [ 2, 3 ],  // L
    [ 0, 0 ],  // M
    [ 0, 0 ],  // N
    [ 0, 0 ],  // O
    [ 0, 0 ],  // P
    [ 0, 0 ],  // Q
    [ 0, 0 ],  // R
    [ 1, 3 ],  // S
    [ 0, 0 ],  // T
    [ 0, 0 ],  // U
    [ 2, -6 ],  // V
    [ 2, -6 ],  // W
    [ 0, 0 ],  // X
    [ 0, -2 ],  // Y
    [ 1, 0 ],  // Z
];

size = 12;
font = "Impact";
scale = 1.5;
space = size*2;

module rings() {
    for (i=[0:len(names)-1]) {
        translate(offsets[ord(names[i])-ord("A")])
        translate([-5,i*space,0])
            cylinder(h=4,d=10);
        
    }
}

module holes() {
    for (i=[0:len(names)-1]) {
        translate(offsets[ord(names[i])-ord("A")])
        translate([-5,i*space,0])
            translate([0,0,-1]) cylinder(h=6,d=5);
    }
    }

module first() {
    for (i=[0:len(names)-1]) {
        translate([0,i*space,0])
        linear_extrude(2)
        difference() {
            
        offset(r=scale*3) {
            text(names[i], size=size, font=font, valign="center");
        }
        text(names[i], size=size, font=font, valign="center");
    }
    }
}

module second() {
    for (i=[0:len(names)-1]) {
        translate([0,i*space,1])
        linear_extrude(2)
        difference() {
           fill()
        offset(r=scale*2) {
            text(names[i], size=size, font=font, valign="center");
        }
        text(names[i], size=size, font=font, valign="center");
    }
    }
}
    
module third() {
    for (i=[0:len(names)-1]) {
        translate([0,i*space,2])
        linear_extrude(2)
        difference() {
           fill() 
        offset(r=scale) {
            text(names[i], size=size, font=font, valign="center");
        }
        text(names[i], size=size, font=font, valign="center");
    }
    }
}

module fourth() {
    for (i=[0:len(names)-1]) {
        translate([0,i*space,0])
      linear_extrude(4)
        text(names[i], size=size, font=font, valign="center");
    
    }
}

material = 0;
if (material == 0) {
    difference() {
    union() {
    color("cyan") rings();
    color("cyan") first();
    color("blue") second();
    color("grey") third();
    color("white") fourth();
    }
    holes();
    }
} else if (material == 1) {
    difference() {
        union() {
            rings();
            first();
        }
        holes();
    }
} else if (material == 2) {
    difference() {
       second();
       third();
       fourth();
       rings();
    }
} else if (material == 3) {
difference() {
       third();
       fourth();
       rings();
    }
} else if (material == 4) {
difference() {
       fourth();
       rings();
    }
}
