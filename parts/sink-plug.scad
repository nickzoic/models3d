pipe_id = 40;

//translate([0,0,pipe_id/2])
//cylinder(h=pipe_id/2, d1=pipe_id-4, d2=0);

difference () {
    union () {
        intersection () {
            cylinder(h=pipe_id, d=pipe_id-1);
            translate([0,pipe_id/2,6])
                rotate([90,0,0])
                    cylinder(h=pipe_id, d=12);
                      translate([0,0,pipe_id-2]) cylinder(h=pipe_id/2, d1=pipe_id, d2=0);
      
        }

        difference () {
            union () {
                intersection () {
                    // main cylinder with taper on end
                    cylinder(h=pipe_id, d=pipe_id - 1);
                    cylinder(h=pipe_id*2-4, r1=pipe_id-1, d2=0);
                }
                cylinder(h=3, d=pipe_id+20);
            }
            union () {
                translate([0,0,-2]) cylinder(h=pipe_id/2, d=pipe_id - 4);
                translate([0,0,pipe_id/2-3]) cylinder(h=pipe_id/2, d1=pipe_id-4, d2=0);
            }
        }
    }
    translate([0, pipe_id/2, 6])
        rotate([90,0,0])
            cylinder(h=pipe_id+2, d=6);


rotate_extrude(angle=360, convexity=10) {
translate([pipe_id/2, pipe_id*3/4, 0]) circle(d=4, $fn=16);
}}