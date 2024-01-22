$fn=100;

seat_tube_angle = 73;
seat_post_dia = 27.5;

mount_d1 = 16;
mount_h1 = 3;
mount_d2 = 9;
mount_h2 = 3;

thick = 2;
outside_dia = seat_post_dia + thick * 2;
length = outside_dia*1.25;
length2 = outside_dia*0.75;
offset = 5;

rotate([0,180-seat_tube_angle,0])
difference() {
    hull() {
        translate([0,0,offset]) cylinder(d=outside_dia, h=length, center=true);
        rotate([0,seat_tube_angle,0]) cylinder(d=outside_dia, h=length2);
    }
    cylinder(d=seat_post_dia, h = 100, center=true);
    rotate([0,seat_tube_angle,0]) {
        cylinder(d=mount_d1+1, h=length2-mount_h1-0.5);
        cylinder(d=mount_d2+1,h=100,center=true);
    }
}