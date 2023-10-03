// mini derailleur mudguard
//
// cable ties to set post above derailleur and
// screws to the chain stay bridge mudguard hole
//
// print in flexy TPU or similar


seat_dia = 34;     // seat tube outer diameter

post_offset = 25;  // offset from center of seat post to guard, to clear derailleur

extra_wrap = 5; // extra wrap around seatpost

gap = 5;      // gap for a cable tie around the seat tube

length = 150;  // overall length including nose

width = 45;  // overall width

nose_width = 25;  // nose between chain stays
nose_length = 30;  // offset to reach retaining screw
nose_hole = 6;     // hole for retaining screw

thickness = 1;  // main thickness

// probably doesn't make sense to have both side walls and the extra thick bit.
 
extra_width=10; // extra thick part along middle
extra_thick=2; // thickness of thicker parts

walls = 5; // side walls,


$fn=64;


difference() {
    union() {
        translate([0,-width/2,0])cube([length-nose_width/2, width, thickness]);
        translate([thickness,-width/2,0])cube([gap, width, extra_thick]);
        translate([length-nose_width/2,0,0]) cylinder(d=nose_width,h=extra_thick);
        translate([0,-extra_width/2,0]) cube([length-nose_width/2, extra_width, extra_thick]);
        }
    translate([length-nose_length,width/2,-1]) cylinder(r=(width-nose_width)/2,h=thickness+2);
    translate([length-nose_length,-width/2,-1]) cylinder(r=(width-nose_width)/2,h=thickness+2);
    translate([length-nose_length,nose_width/2,-1]) cube([length, width, thickness+2]);
   translate([length-nose_length,-width-nose_width/2,-1]) cube([length, width, thickness+2]);
    translate([length - nose_width/2,0,-1]) cylinder(d=nose_hole, h=extra_thick+2); 
}

translate([0,width/2-thickness,0]) cube([length-nose_length-width/2+nose_width/2, thickness, walls]);
translate([0,-width/2,0]) cube([length-nose_length-width/2+nose_width/2, thickness, walls]);

translate([0, -width/2, 0]) multmatrix([
        [1,0,-0.5,0],[0,1,0,0],[0,0,1,0]])
cube([thickness, width, 12.5]);

difference() {
   union() {
   translate([0, -width/2,0]) cube([thickness, width, post_offset*2]);
   translate([thickness+gap, -width/2,0]) cube([thickness, width, post_offset*2]);
   translate([0,0,post_offset])rotate([0,90,0]) cylinder(d=seat_dia+thickness*4,h=thickness*2+gap);
   }
   translate([-1,0,post_offset])rotate([0,90,0]) cylinder(d=seat_dia,h=thickness*2+gap+2);
   translate([-1,-width/2-1,post_offset+extra_wrap]) cube([thickness*2+gap+2,width+2,post_offset]);
}
