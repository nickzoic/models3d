// third prototype for a little widget to fit between fork legs
// when front wheel is removed and secured in place with skewer
// to protect fork ends when boxed up.

$fn=100;

length = 100;     // length between forks
bore = 5.5;         // skewer bore
inner_dia = 10;    // middle bit diameter.
outer_dia = 20;   // largest diameter
drop_dia = 8;     // dropout diameter, also the center bit and the width in the dropouts
drop_wid = 6;     // dropout length, actually
drop_hei = 15;    // height front center of axle to base plate to clear dropouts
base_wid = 40;    // base plate width
angle = 11.5;     // base plate angle in degrees
base_thick = 5; // base plate thickness
wiggle = 0;  // a bit of wiggle room on the dropout slots;
hole_size = 5; // holes for screws / cable ties

rotate([-90,0,0]) difference() {
    union() {
        cylinder(d=drop_dia, h=length+2*drop_wid);
        translate([0,0,drop_wid]) cylinder(d=inner_dia,h=length);
        translate([0,0,drop_wid]) cylinder(d1=outer_dia,d2=inner_dia,h=length/4);
        translate([0,0,drop_wid+length*3/4]) cylinder(d2=outer_dia,d1=inner_dia,h=length/4);
        
        // angled ends
        intersection() {
            translate([-base_wid/2, -drop_dia/2, 0]) cube([base_wid,drop_hei+base_thick+drop_dia/2,length+drop_wid*2]); 
        rotate([0,0,angle]) union() {
            translate([-drop_dia/2+wiggle,0,0]) cube([drop_dia-wiggle*2,100,drop_wid]);
            translate([-drop_dia/2+wiggle,0,length+drop_wid]) cube([drop_dia-wiggle*2,100,drop_wid]);
        }
        }
        
        // center support
        translate([-inner_dia/2+1,0,drop_wid]) cube([inner_dia-2,drop_hei,length]);
        
        // base plate
        translate([-base_wid/2,drop_hei,0]) cube([base_wid,base_thick,length+2*drop_wid]);
        translate([0,drop_hei,0]) rotate([-90,0,0]) cylinder(d=base_wid,h=base_thick);
        translate([0,drop_hei,length+drop_wid*2]) rotate([-90,0,0]) cylinder(d=base_wid,h=base_thick);
    }
    
    // bore
    translate([0,0,-1]) cylinder(d=bore,h=length+2*drop_wid+2);
    
    // screw holes
    for (z=[-hole_size*2,length+drop_wid*2+hole_size*2]) {
        translate([0,0,z]) rotate([-90,0,0]) cylinder(h=drop_hei+base_thick+1,d=hole_size);
    }
    
    // cable tie holes
    for(x=[-base_wid/3,+base_wid/3]) {
    for (z=[-hole_size,length/4+drop_wid,length/2+drop_wid,length*3/4+drop_wid,length+drop_wid*2+hole_size]) {
    translate([x,0,z]) cube([hole_size,100,hole_size], center=true);
    }
    }
    
    translate([0,drop_hei+base_thick-1,length/2+drop_wid])
    rotate([0,90,90]) linear_extrude(2) text("nick.zoic.org ≈ v3", halign="center", valign="center");
    
}
