$fn=64;

bar_dia = 22.5;
thick = 5;
length = 30;
roundoff = 2.5;
bevel=1;

outer = bar_dia + (thick-roundoff) * 2;

difference() {
  minkowski() {
      union() {
        cylinder(h=outer, d=outer);
        translate([outer/4,0,outer/2])
          cube([outer/2, outer, outer], center=true);
      }
      sphere(r=roundoff);
  }
  translate([0,0,-5])
    cylinder(h=outer+10,d=bar_dia);
  translate([0,0,-roundoff])
    cylinder(d1=bar_dia+bevel*1.5,d2=bar_dia,h=bevel);
  translate([0,0,outer+roundoff-bevel])
    cylinder(d2=bar_dia+bevel*1.5,d1=bar_dia,h=bevel);
  translate([0,0,outer/2])
  rotate([90,0,0]) cylinder(d=3,h=outer);  
  hull() {
    translate([bar_dia/2,0,outer/2])
      rotate([0,-90,0]) {
        translate([0,5,0])
          cylinder(d=7,h=outer);
        translate([0,-5,0])
          cylinder(d=7,h=outer);
      }
  }
  translate([outer,0,outer/2])
    rotate([0,-90,0]) {
      translate([0,5,0])
        cylinder(d=3,h=outer);
      translate([0,-5,0])
        cylinder(d=3,h=outer);
    }
  translate([bar_dia/2+1.5,0,outer/2])
    rotate([0,-90,0]) {
      translate([0,5,0])
        cylinder(d1=3,d2=7,h=1.5);
      translate([0,-5,0])
        cylinder(d1=3,d2=7,h=1.5);
    }  
    //translate([0,0,-100]) cube(1000);
}