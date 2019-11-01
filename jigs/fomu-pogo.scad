// pogo pins offsets in inches
// from https://github.com/im-tomu/fomu-hardware/blob/master/hacker/README.asciidoc#programming-jig

$fn=32;

pin_offsets = [
    [ 0, 0.275, 0 ],
    [ 0, 0.160, 300 ],
    [ 0, 0.0825, 225 ],
    [ 0.027, 0, 180 ],
    [ 0.100, 0, 0 ],
    [ 0.170, 0, 90 ],
    [ 0.302, 0, 45 ]
];

size = 20;
corner = 3;

// measured off a sample FOMU, with an extra 
// 0.1mm added to fit.
width = 9.5;
length = 13;

thick = 15;
pinlen = 7;

// pin offsets from edges
xo = 0.90;
yo = 0.90;

// little polarity pin
xop = 0;
yop = 10.5;

difference() {
    hull() {
        for(x=[-1,+1]) {
            for(y=[-1,+1]) {
                translate([x*(size/2-corner),y*(size/2-corner), -thick+1]) cylinder(d=corner*2,h=thick);
            }
        }
    }
    for (x=[-1,+1]) {
        for (y=[-1,+1]) {
            translate([x*(size/2-corner),y*(size/2-corner),0]) cylinder(d=corner, h=50, center=true);
        }
    }
    difference() {
        translate([0,0,1]) cube([width, length, 4], center=true);
        translate([width/2,yop-length/2,0]) cylinder(d=1,h=10,center=true);
        translate([-width/2,2,-1]) cube([2,10,2],center=true);
        translate([0,length/2,-1]) cube([10,2,2],center=true);
    }
    translate([width/2-xo,-length/2+yo,0]) {
        for (po = pin_offsets) {
            translate([-po[0]*25.4,po[1]*25.4,0]) {
                rotate([0,0,po[2]]) rotate([7,0,0]) {
                    cylinder(h=50,d=1.6,center=true);
                }
            }
            
        }
    }
    translate([-1.5,3,-thick]) linear_extrude(2) rotate([180,0,0]) text("3",valign="center",halign="center");
}
