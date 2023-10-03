thickness = 2;
length = 100;
fork_inner_width = 55;
fork_thickness = 30;
arch_height = 25;
arch_radius = 25;
height = 50;

pin_diameter = 10;
pin_height = 25;
pin_hole_height = 10;
pin_hole_diameter = 6;

module half() {
   translate([fork_inner_width/2-arch_radius,0,0])
   difference() {
   intersection() {
        cylinder(h=length, r=arch_radius);
        cube([arch_radius,arch_radius,length]);
        }   
   translate([0,0,-1]) cylinder(h=length+2, r=arch_radius-thickness);
   
   }
   translate([0,arch_radius-thickness,0]) cube([fork_inner_width/2-arch_radius,thickness,length]);
   difference() {
   translate([fork_inner_width/2-thickness,-100,0]) cube([thickness,100,length]);
    translate([0,-height+20,fork_thickness/2]) rotate([0,90,0]) cylinder(d=6,h=100);
    }
 }

module pin() {
   #translate([0,arch_radius-thickness,0]) rotate([-90,0,0]) cylinder(d=pin_diameter, h=pin_height);
  }
  
 intersection() {
 union() {
     half();
     mirror([1,0,0]) half();
     mirror([0,0,1]) half();
     mirror([1,0,0]) mirror([0,0,1]) half();
}
scale([1,1,length/height])
sphere(r=height);
}

pin();
