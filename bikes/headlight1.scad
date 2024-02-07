bar_dia = 22.5;
thick = 2.5;
length = 30;

xthick = 5;

outer_dia = bar_dia + thick * 2;

top_dia = 30;
$fn=100;


rotate([-90,0,0])
difference() {
  union() {
    hull() {
        cylinder(d=outer_dia, h=length, center=true);
        translate([0,bar_dia/2+xthick,0]) rotate([90,0,0]) cylinder(d=top_dia,h=1);
    }
    
    
  }
  translate([0,0,-length/2]) cylinder(d1=bar_dia+2, d2=bar_dia, h=1);
  
  rotate([0,180,0]) translate([0,0,-length/2]) cylinder(d1=bar_dia+2, d2=bar_dia, h=1);
  
  cylinder(d=bar_dia, h=length*2,center=true);
  for (a=[-1,1]) {
    translate([a*5,0,0]) rotate([-90,0,0]) {
        cylinder(d=3,h=100, center=true);
       translate([0,0,bar_dia/2+0.5]) cylinder(d1=7,d2=3,h=1); 
    }
    rotate([0,0,a*45]) translate([0,5,0]) 
  cube([1, bar_dia, length*2], center=true);
  }
  hull() {
  for (a=[-1,1]) {
    translate([a*5,0.5-thick,0]) rotate([90,0,0]) {
        cylinder(d=7,h=outer_dia, center=true);
    }
  }
  }

}