$fn=64;

module piece(radius, label, thick=2) {
  difference() {
    hull() {
        cylinder(r=radius,h=thick);
        translate([radius*4,0,0]) cylinder(r=radius,h=thick);
        translate([radius,0,0]) cube([radius*4,radius,thick]);
    }
    translate([radius*3,radius,-1]) cylinder(r=radius,h=thick+2);
    translate([radius*1.5,-radius*1.1,-1]) rotate([0,0,45]) union() {
        cylinder(r=radius,h=thick+2);
        translate([-radius,0,0]) cube([radius,radius,thick+2]);
        translate([0,-radius,0]) cube([radius,radius,thick+2]);
    }
    translate([0,0,-1]) cylinder(d=thick,h=thick+2);
    translate([radius*4,-radius/4,thick-1]) rotate([0,0,45]) linear_extrude(2) text(label,size=radius*0.8,halign="center",valign="center");
    }
}

for (a=[2, 3,4,5,6,7,8,9,10]) {
    translate([0, 1.5*a*a, 0]) piece(a,str(a));
    rotate([0,0,180])
    translate([-80, 1.5*a*a-170, 0]) piece(a+0.5,str(a,"½"));
}

//translate([60,0,0]) piece(2);
//piece(10);