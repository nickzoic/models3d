scale([1/50,1/50,1/50]) {

for (x=[0,1300,2600,3900]) translate([x,0,0]) {
cube([1180,25,3010]);
cube([1180,900,25]);
intersection() {
    union() {
        cube([25,900,900]);
        translate([1155,0,0]) cube([25,900,900]);
    }
    translate([590,0,0]) rotate([45,0,0]) cube([1180,1400,1400],center=true);
}
}

for (x=[0,1500,3000]) {
translate([x,-1000,0]) {
    cylinder(d=1400,h=200);
    for (a=[0,120,240]) {
        rotate([0,0,a]) translate([0,345,1705]) cube([1180,25,3010],center=true);
        }
        }
        }

        
        translate([1000,-3000,0]) {
        difference() {
            cube([1500,900,900]);
            translate([50,50,50]) cube([1400,900,850]);
            }
            }
            
            
     for (x=[3000,3500]) {
   translate([x,-2500,0]) {
       cylinder(d=450,h=50);
       cylinder(d=50,h=1500);
       for (a=[0,90,180,270])
       translate([0,0,1200]) rotate([45,0,a]) cylinder(d=50,h=300);
   }
   
   }
        }