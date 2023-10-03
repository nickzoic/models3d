length = 100;
width = 75;
thickness = 2;
slots = 8;

scale([length/width,1,1]) 
intersection() {
    cylinder(h=thickness*2, d=width);
rotate([90,0,90]) linear_extrude(height=width, center=true) polygon([[-width/2,thickness/2],[-width/6,thickness],[width/6,thickness],[width/2,thickness/2]]);
   }
