// metalmate aluminum crescent 8767
// 38.1 x 4.75

al_width = 38.1;
al_thick_edge = 1.0;
al_thick_center = 1.6;
al_thick_curve = 4.6;

// these should be done with maths (tm) from the
// numbers above instead of just messing around until
// they're about right.

al_radius_1 = 52.25;
al_radius_2 = 62;


seatpost_dia = 34;
seatpost_offset = 15;

// I maybe don't really need this to be so detailed but never mind ...

module extrusion(length) { 
    difference() {
        intersection() {
            translate([-al_width/2+al_thick_edge/2, -length/2, 0])
                cube([al_width-al_thick_edge, length, al_thick_curve]);
            translate([0,0,al_thick_curve-al_radius_1])
                rotate([90,0,0])
                    cylinder(r=al_radius_1,h=length,center=true, $fn=200);
        }
        translate([0,0,al_thick_curve-al_radius_2-al_thick_center])
            rotate([90,0,0])
                cylinder(r=al_radius_2, h=length+2,center=true,$fn=200);
    }
    for (x = [-1,1])
        translate([x*(al_width/2-al_thick_edge/2), 0, al_thick_edge/2*1.35])
            rotate([90,0,0])
                cylinder(d=al_thick_edge, h=length, center=true, $fn=64);        
}

$fn=200;

upper_mount_height = 50;
lower_mount_height = 10;

module upper_mount() {
    difference() {
        cube([al_width, seatpost_dia+seatpost_offset, upper_mount_height], center=true);
        translate([-al_width/2,-50,upper_mount_height/2]) rotate([0,30,0]) cube([100,100,upper_mount_height]);
        translate([0, -seatpost_offset/2-seatpost_dia/2]) cylinder (d=seatpost_dia, h=upper_mount_height*2, center=true);        
        rotate([17,0,0]) translate([0, seatpost_offset/2+al_radius_1]) cylinder(r=al_radius_1, h=upper_mount_height*2, center=true);
        
        // two cable ties
       for (z = [-4, -18])
        translate([0,-seatpost_offset/2-seatpost_dia/2, z])
           rotate_extrude() {
            translate([seatpost_dia/2+5,0]) square([2,5], center=true);
        }
       /*for (z = [20, 8])
           for (a = [-14, 14])
                #translate([0,al_radius_1,z]) rotate([17,0,a])
       rotate([90,0,0]) cylinder(d=3,h=al_radius_1+seatpost_offset);*/
      
      // M5 nylock nut and screw.
     translate([0,al_radius_1,6]) rotate([107,0,0]) cylinder(d=5, h=al_radius_1+seatpost_offset);
     translate([0,al_radius_1,6]) rotate([107,0,0]) translate([0,0,al_radius_1+seatpost_offset-12]) cylinder(d=8.5, $fn=6, h=20);
     
        }
}
module lower_mount() {
    difference() {
        cube([al_width, 10, 25], center=true);
        translate([0,al_radius_1-2,0]) rotate([10,0,0]) cylinder(r=al_radius_1, h=100, center=true);
        
        translate([0,0,5.5]) rotate([90,0,0]) cylinder(d=5, h=20, center=true);
    }
}


upper_mount();
translate([0,25,-12.5]) lower_mount();

//extrusion(100);
