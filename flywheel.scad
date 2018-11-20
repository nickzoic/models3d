use <MCAD/involute_gears.scad>

$fn=100;

/*difference() {
    cube([35,25,5], center=true);
    translate([-18,-13,0]) rotate([0,0,45]) cube([3,3,3]);
    translate([-12,-6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=141,
        bore_diameter=0,
        gear_thickness = 12
    );
    translate([0,-6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=142,
        bore_diameter=0,
        gear_thickness = 12 
    );
   translate([12,-6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=143,
        bore_diameter=0,
        gear_thickness = 12 
    );
   translate([12,6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=144,
        bore_diameter=0,
        gear_thickness = 12 
    );
   
    translate([0,6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=145,
        bore_diameter=0,
        gear_thickness = 12
    );
   
    translate([-12,6,-5]) gear(
        number_of_teeth=9,
        circular_pitch=146,
        bore_diameter=0,
        gear_thickness = 12
    );
}*/

/*difference() {
    cube([33,33,10], center=true);
    translate([-14,14,0]) cylinder(d=2,h=6);
    
    translate([-8,8,-6]) cylinder(d=12.5,h=12);
    #translate([8,8,-6]) cylinder(d=12.75,h=12);
    translate([8,-8,-6]) cylinder(d=13.0,h=12);
    translate([-8,-8,-6]) cylinder(d=13.25,h=12);
    
}*/

difference() {
    cylinder(d=20, h=8);
    gear(
        number_of_teeth=9,
        circular_pitch=142,
        bore_diameter= 0,
        gear_thickness = 10
    );
}

difference() {
    cylinder(d=107,h=10);
    translate([0,0,7]) cylinder(d=74,h=7);
    for (i = [0:4]) {
        rotate([0,0,i*360/5]) translate([23.5,0,-1]) cylinder(d=24,h=12);
    }
    
    /*translate([23.5,0,-1]) cylinder(d=27,h=12);
    translate([-23.5,0,-1]) cylinder(d=27,h=12);
    translate([0,23.5,-1]) cylinder(d=27,h=12);
    translate([0,-23.5,-1]) cylinder(d=27,h=12);
    */
    
    for (i = [0:15]) {
        rotate([0,0,i*360/16]) translate([45,0,-1]) cylinder(d=12.75, h=12);
    }
}
