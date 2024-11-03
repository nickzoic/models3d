include <./gears.scad>

ring_ratio = 4;

gear_modulus = 3;
helix_angle = 20;
gear_thick = 10;

disk_thick = 5;

//// should depend on ring_ratio
ring_small_teeth = 12;
ring_large_teeth = ring_small_teeth * ring_ratio;

ring_dia = (ring_large_teeth * gear_modulus);
ring_offs = (ring_large_teeth - ring_small_teeth) * gear_modulus / 2;

rim_width = 50; //(outer_dia - ring_dia) / 2;

shaft_diameter = 5.5;
shaft_length = 6;
shaft_flat = 3.5;

difference() {
    union() {
        translate([0,0,-1])
        spur_gear(
            modul = gear_modulus,
            tooth_number = ring_small_teeth,
            width = gear_thick / 2 + 1,
            bore = 0,
            helix_angle=helix_angle,
            optimized = false
        );
        translate([0,0,gear_thick+1]) mirror([0,0,1]) spur_gear(
            modul = gear_modulus,
            tooth_number = ring_small_teeth,
            width = gear_thick / 2 + 1,
            bore = 0,
            helix_angle=helix_angle,
            optimized = false
        );
        translate([0,0,-3]) cylinder(r=rim_width/2+5,h=2);
    }
    intersection() {
            cylinder(d=shaft_diameter,h=shaft_length+2,center=true);
            cube([shaft_diameter,shaft_flat,shaft_length+2],center=true);
    }
    
}
    
    
difference() {
    union() {
        translate([0,-ring_offs,0]) ring_gear(
            modul = gear_modulus,
            tooth_number = ring_large_teeth,
            width = gear_thick / 2,
            rim_width = rim_width,
            helix_angle=helix_angle
        );
        translate([0,-ring_offs,gear_thick]) mirror([0,0,1]) ring_gear(
            modul = gear_modulus,
            tooth_number = ring_large_teeth,
            width = gear_thick / 2,
            rim_width = rim_width,
            helix_angle=helix_angle
        );
    }
    
    for (a=[1:12]) { 
        translate([0,-ring_offs,1])
        rotate([0,0,-a*30]) {
            translate([0,ring_dia/2+rim_width/3,0])
            linear_extrude(gear_thick)
            text(str(a), size=30, halign="center", valign="middle", font="c059", spacing=1);
        }
    }
           
}

difference() {
        translate([0,0,gear_thick+1]) cylinder(h=disk_thick,r=rim_width/2+5);
       
    for (a=[0:11]) {
        rotate([0,0,-a*30]) {
            translate([0,rim_width/2-5,gear_thick+2])
            linear_extrude(disk_thick)
            text(str((a*60/ring_ratio)%60), size=disk_thick, halign="center", valign="middle", font="c059");
        }
    }
}