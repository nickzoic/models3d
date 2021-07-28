$fn=100;

wall_thick = 3;

board_width = 100;
board_depth = 79;
board_clearance = 2.5;

fan_width = 41;
fan_thick = 15;

vent_thick = 10;

hole_diameter = 2.8;
hole_offset_x1 = 4;
hole_offset_x2 = 90;
hole_offset_y1 = 17;
hole_offset_y2 = 75;

circ = 79;

sclr = 2;

difference() {
    cube([
        wall_thick*3+fan_thick+board_clearance*2+board_width+vent_thick,
        wall_thick*2+board_clearance*2+board_depth,
        wall_thick*2+fan_width/2,
    ]);
    translate([wall_thick+fan_thick+wall_thick,wall_thick,wall_thick]) cube([
        board_clearance*2+board_width,
        board_clearance*2+board_depth,
        wall_thick*2+fan_width/2,
    ]);
    translate([wall_thick, board_depth-fan_width+board_clearance, wall_thick]) {
        cube([ fan_thick, fan_width, fan_width ]);
        translate([fan_thick/2,fan_width/2,fan_width/2]) rotate([0,90,0]) cylinder(d=fan_width,h=fan_thick+wall_thick*3,center=true);
    }
}
 
board_offset_x = wall_thick+fan_thick+board_clearance;
board_offset_y = wall_thick+board_clearance;

translate([board_offset_x, board_offset_y, wall_thick]) {
    for (x = [hole_offset_x1, hole_offset_x2]) {
        for (y = [hole_offset_y1, hole_offset_y2]) {
            translate([x,y,0]) {
                cylinder(h=sclr+thick,d1=hole*3, d2=hole*2);
                cylinder(h=height,d1=hole, d2=hole*3/4);
            }
        }
    }
}


/*difference() {
    cube([width+2*clr+2*thick,depth+2*clr+2*thick,height],center=true);
    translate([0,0,thick]) cube([width+2*clr,depth+2*clr,height],center=true);
    translate([0,-depth/2-thick,thick+sclr]) cube([width,thick*2,height],center=true);
    translate([-width/2+43,depth/2+thick,6]) cube([20,thick*2,height],center=true);
    
    translate([0,0,-height/2+thick-1]) cylinder(h=2, d1=circ-4, d2=circ, center=true);   
}

rotate([0,0,30]) {
    translate([0,22,-height/2+thick-3]) linear_extrude(height=2) text("NVIDIA",halign="center",valign="center",size=11);
    translate([0,12,-height/2+thick-3]) linear_extrude(height=2) text("Jetson Nano",halign="center",valign="center",size=7);
    translate([0,3,-height/2+thick-3]) linear_extrude(height=2) text("DevKit P3450",halign="center",valign="center", size=9);
    translate([0,-7,-height/2+thick-3]) linear_extrude(height=2) text("PCB protection sled",halign="center",valign="center", size=6);
    translate([0,-19,-height/2+thick-3]) linear_extrude(height=2) text("v0.2",halign="center",valign="center",size=15);
    translate([0,-31,-height/2+thick-3]) linear_extrude(height=2) text("@nickzoic",halign="center",valign="center",size=5);
}    

for (x = [-width/2+ho1,width/2-ho2])
    for (y = [-depth/2+ho3,depth/2-ho1]) {
        translate([x,y,-height/2+thick]) cylinder(h=sclr+thick,d1=hole*3, d2=hole*2, center=true);
        translate([x,y,0]) cylinder(h=height,d1=hole, d2=hole*3/4, center=true);
        
    }
*/