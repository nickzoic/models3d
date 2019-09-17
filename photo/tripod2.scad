// this is the same penguin pod idea but using a rail
// clamp I bought on Ebay for a few bucks.
// "Metal Clamp Fr QR50 Quick Release Plate Compatible Arca Swiss"
// https://www.ebay.com.au/itm/Metal-Clamp-Fr-QR50-Quick-Release-Plate-Compatible-Arca-Swiss-Tripod-Ball-Head-B/153146210221?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649

$fn=100;

d1 = 20;
d2 = 40;
x = 93;
y = 108;
yo = 10;
z = 15;
t = 3;

xd = 6;
yd1 = 14;
yd2 = 50;


difference() {
    union() {
        // three legs
        hull() {
            translate([-x/2,-y/2,0]) cylinder(d=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
        }
        hull() {
            translate([+x/2,-y/2,0]) cylinder(d=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
        }    
        hull() {
            translate([0,y/2,0]) cylinder(d=d1, h=t);
            translate([0,yo,z]) cylinder(d=d2,h=t);
        }
        
        // three feet
        translate([-x/2,-y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
        translate([+x/2,-y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
        translate([0,y/2,-t]) cylinder(d1=d1/2, d2=d1, h=t);
        
        // little bar which stops the clamp rotating
        hull() {
            translate([-7,yo,z+t]) cylinder(d=4,h=2);
            translate([+7,yo,z+t]) cylinder(d=4,h=2);
        }
    }
    
    // screw hole and relief
    translate([0,yo,0]) cylinder(d=xd,h=z+t+4);
    translate([0,yo,z-yd2+yd1]) cylinder(d1=yd2, d2=yd1, h=yd2-yd1);
}