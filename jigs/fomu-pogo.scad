// pogo pins offsets in inches
// from https://github.com/im-tomu/fomu-hardware/blob/master/hacker/README.asciidoc#programming-jig

$fn=32;

pin_offsets = [
    [ 0, 0.275 ],
    [ 0, 0.160 ],
    [ 0, 0.0825 ],
    [ 0.027, 0 ],
    [ 0.100, 0 ],
    [ 0.170, 0 ],
    [ 0.302, 0 ]
];

size = 30;
corner = 5;

// measured off a sample FOMU, with an extra 
// 0.1mm added to fit.
width = 9.5;
length = 13;

thick = 13;
pinlen = 7;

// pin offsets from edges
xo = 0.90;
yo = 0.90;

// little polarity pin
xop = 0;
yop = 10.5;

difference() {
    //translate([0,0,thick/2]) cube([size,size,thick],center=true);
    hull() {
        for(x=[-1,+1]) {
            for(y=[-1,+1]) {
                translate([x*(size/2-corner),y*(size/2-corner),0]) cylinder(d=corner*2,h=thick);
            }
        }
    }
    for (x=[-1,0,+1]) {
        for (y=[-1,0,+1]) {
            translate([x*(size/2-corner),y*(size/2-corner),0]) cylinder(d=corner, h=50, center=true);
        }
    }
    difference() {
        translate([0,0,thick]) cube([width, length, 4], center=true);
        translate([width/2,yop-length/2,thick]) cylinder(d=1,h=10,center=true);
        translate([-width/2,2,thick-2]) cube([2,10,2],center=true);
        translate([0,length/2,thick-2]) cube([10,2,2],center=true);
    }
    translate([width/2-xo,-length/2+yo,0]) {
        for (po = pin_offsets) {
            translate([-po[0]*25.4,po[1]*25.4,thick-pinlen]) {
                cylinder(h=8,d=1.6);
                cylinder(h=50,d=1.2,center=true);
            }
            
        }
    }
}
