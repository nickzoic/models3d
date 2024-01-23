$fn=100;

// seat tube end
seat_tube_angle = 73;
seat_post_dia = 27.7;
length = 30;

// rear end of the thing
end_dia = 20;
end_offs = 10;
length2 = 60;

// mount for light
mount_d1 = 16;
mount_h1 = 3;
mount_d2 = 9;
mount_h2 = 3;
hole_dia = 5;

thick = 2;


outside_dia = seat_post_dia + thick * 2;
offset = -10;

rotate([0,180-seat_tube_angle,0])
difference() {
    hull() {
        translate([0,0,offset]) cylinder(d=outside_dia, h=length, center=true);
        //rotate([0,seat_tube_angle,0])
            //cylinder(d1=outside_dia, d2=end_dia, h=length2);
        rotate([0,seat_tube_angle,0]) {
            translate([end_offs/2,0,length2-1])
                cylinder(d=end_dia, h=1);
            translate([-end_offs/2,0,length2-1])
                cylinder(d=end_dia, h=1);
        }
            
    }
    cylinder(d=seat_post_dia, h = 100, center=true);
    rotate([0,seat_tube_angle,0]) {
        cylinder(d=mount_d1+1, h=length2-mount_h1-0.5);
        cylinder(d=mount_d2+1,h=200);
        cylinder(d=hole_dia,h=200,center=true);
        
        translate([0,0,length2-mount_h1-mount_h2]) cube([4,100,2],center=true);
        //translate([8,0,length2-mount_h1-mount_h2]) cube([4,100,2],center=true);
        //translate([-8,0,length2-mount_h1-mount_h2]) cube([4,100,2],center=true);
        //translate([0,0,length2+5]) cube([100,15,10],center=true);
    }
    translate([10,0,offset]) cube([seat_post_dia, 1, 100], center=true);
}

// first version: it's a little too tight on the seat post, needs a relief slot
// i had to hammer it on and cut it with a bread knife to get it off!
// its also a little short, eg: the light is too close to the post
// and it needs just a smidge more friction on rotation, maybe a rubber o-ring?
// but not bad.
// maybe make the stem really long so it can be held vertical and charged in-place?

// second version: cable tie hole is a smidge too small and needs to be up 1mm: on top of the mount not centered on it.
// fit on post is pretty good
// screwdriver hole is a bit small and it's quite fiddly as a
// result
// could be even further offset upwards
// charging cable access is fine.
