// based loosley on 
// https://ritcheylogic.com/bike/handlebars/comp-kyote-handlebar

clamp_len = 115;
clamp_dia = 31.8;
rise = 35;
back_sweep = 27.5;
length = 800;
control_len = 210;
control_dia = 22.2;
offset =37*800/842; // measured from image
rollback = 20;

taper_width=160;
taper_width2=335;
taper_angle=38;
taper_length=(taper_width2-taper_width)/2 / cos(taper_angle);
rise_angle=asin(rise/taper_length);
stem_length = 60;
stem_angle = 30;
head_angle = 71;

rotate([0,90,0]) cylinder(d=clamp_dia, h=clamp_len, center=true);

rotate([rollback,0,0]) {
    translate([-length/2,-offset,rise]) rotate([0,90,back_sweep]) cylinder(h=control_len, d=control_dia);

    translate([length/2,-offset,rise]) rotate([0,-90,-back_sweep]) cylinder(h=control_len, d=control_dia);


    hull() {
        translate([clamp_len/2,0,0]) sphere(d=clamp_dia);
        translate([length/2,-offset,rise]) rotate([0,-90,-back_sweep]) translate([0,0,control_len]) sphere(d=control_dia);
    }

    hull() {
        translate([-clamp_len/2,0,0]) sphere(d=clamp_dia);
        translate([-length/2,-offset,rise]) rotate([0,90,back_sweep]) translate([0,0,control_len]) sphere(d=control_dia);
    }

    //translate([taper_width/2,0,0]) rotate([0,90-rise_angle,taper_angle]) cylinder(d1=clamp_dia,d2=control_dia,h=taper_length);
}

hull() {
rotate([0,90,0]) cylinder(d=clamp_dia+8,h=clamp_len/3, center=true);
translate([0,-stem_length*cos(stem_angle),-stem_length*sin(stem_angle)]) rotate([90-head_angle,0,0]) cylinder(d=clamp_dia+8,h=clamp_len/3,center=true);
}
translate([0,-stem_length*cos(stem_angle),-stem_length*sin(stem_angle)]) rotate([90-head_angle,0,0]) translate([0,0,-clamp_len/2]) cylinder(d=clamp_dia,h=clamp_len/2);
