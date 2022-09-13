blade_width = 6.35;
blade_thick = 1.6;
blade_length = 17.35;
blade_space = 13.7;
blade_angle = 30;

earth_width = 6.35;
earth_thick = 1.6;
earth_length = 20;
earth_space = 10.31;

outer_diameter = 40;
outer_offset = 4;
outer_thick = 5;

outside_diameter = outer_diameter + 4;
outside_height = max(blade_length, earth_length)+outer_thick+3;

groove = 2;

$fn=100;

difference() {
    union() {
        translate([0,outer_offset,0]) cylinder(d=outside_diameter, h=outside_height/2-groove*2);
        translate([0,outer_offset,outside_height/2-groove*2]) cylinder(d1=outside_diameter, d2=outside_diameter-groove,h=groove);
        translate([0,outer_offset,outside_height/2-groove]) cylinder(d1=outside_diameter-groove, d2=outside_diameter,h=groove);
        translate([0,outer_offset,outside_height/2]) cylinder(d=outside_diameter,h=groove);
        translate([0,outer_offset,outside_height/2+groove]) cylinder(d1=outside_diameter,d2=outside_diameter*2/3,h=outside_height/2-groove);
    }
    translate([0,outer_offset,0]) cylinder(d=outer_diameter, h=outer_thick);
    
    translate([blade_space/2,0,blade_length/2+outer_thick]) rotate([0,0,-blade_angle]) cube([blade_thick,blade_width,blade_length], center=true);
    translate([-blade_space/2,0,blade_length/2+outer_thick]) rotate([0,0,blade_angle]) cube([blade_thick,blade_width,blade_length], center=true);
    translate([0,earth_space,earth_length/2+outer_thick]) cube([earth_thick, earth_width, earth_length], center=true);
}