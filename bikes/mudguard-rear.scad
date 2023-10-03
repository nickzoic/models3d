// mini derailleur mudguard
//
// cable ties to set post above derailleur and
// screws to the chain stay bridge mudguard hole
//
// print in flexy TPU or similar


seat_dia = 34;     // seat tube diameter

offset = 25;  // offset from center of seat post to guard, to clear derailleur
          

length = 150;  // overall length

width = 42;  // overall width

nose_width = 25;  // nose between chain stays
nose_length = 20;  // offset to reach retaining screw
nose_hole = 6;     // hole for retaining screw

thickness = 1;  // main thickness, center is twice this
gap = 5;      // gap for cable tie

extra = 5; // extra wrap around seatpost

$fn=64;


difference() {
    union() {
        translate([0,-width/2,0])cube([length-nose_width/2, width, thickness]);
        translate([thickness,-width/2,0])cube([gap, width, thickness*2]);
        translate([length-nose_width/2,0,0]) cylinder(d=nose_width,h=thickness*2);
        translate([0,-nose_hole,0]) cube([length-nose_width/2, nose_hole*2, thickness*2]);
        }
    translate([length-nose_length,width/2,-1]) cylinder(r=(width-nose_width)/2,h=thickness+2);
    translate([length-nose_length,-width/2,-1]) cylinder(r=(width-nose_width)/2,h=thickness+2);
    translate([length-nose_length,nose_width/2,-1]) cube([length, width, thickness+2]);
   translate([length-nose_length,-width-nose_width/2,-1]) cube([length, width, thickness+2]);
    translate([length - nose_width/2,0,-1]) cylinder(d=nose_hole, h=thickness*2+2); 
}

difference() {
   union() {
   translate([0, -width/2,0]) cube([thickness, width, offset*2]);
   translate([thickness+gap, -width/2,0]) cube([thickness, width, offset*2]);
   translate([0,0,offset])rotate([0,90,0]) cylinder(d=seat_dia+thickness*4,h=thickness*2+gap);
   }
   translate([-1,0,offset])rotate([0,90,0]) cylinder(d=seat_dia,h=thickness*2+gap+2);
   translate([-1,-width/2-1,offset+extra]) cube([thickness*2+gap+2,width+2,offset]);
}
