bar_dia = 22.7;
thick = 2;
length = 19;

xthick = 15;

outer_dia = bar_dia + thick * 2;

top_dia = 19;
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
        cylinder(d=3.5,h=100, center=true);
       translate([0,0,bar_dia/2+xthick-4.5]) cylinder(d1=7,d2=3.5,h=1.5); 
    }
    //rotate([0,0,a*30]) translate([0,4,0]) 
  cube([1, bar_dia, length*2], center=true);
  }
   translate([0,10,0]) 
  cube([1, bar_dia, length*2], center=true);
  hull() {
  for (a=[-1,1]) {
    translate([a*5,xthick-6.5,0]) rotate([90,0,0]) {
        cylinder(d=7,h=outer_dia, center=true);
    }
  }
  }
//cube(200);
}