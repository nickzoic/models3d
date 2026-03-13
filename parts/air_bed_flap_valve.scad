// replacement valve flap for air beds 
// eg: Mountain Designs Airlite 5.5
// and probably a lot of other inflatable camping gear.
//
// print in flexible TPU at 0.1mm layer thickness,
// no support and reduced travel speed.
//
// the long tip makes it easier to insert
// and pull into the valve body, you can
// trim it off once inserted.

outer_dia = 19;
pin_dia = 2.0;
pin_dia_2 = 1.8;
pin_h = 5;
pin_l = 20;
flap_t = 0.8;
flap_t_2 = 0.4;
$fn=100;

difference() {
    cylinder(d=outer_dia, h=flap_t_2);
    translate([0,0,0.3]) rotate([180,0,0]) linear_extrude(1) text(size=outer_dia/2, "3", halign="center", valign="center", font="Tuffy:style=Bold");
}
translate([0,0,flap_t_2])
cylinder(d1=outer_dia,d2=pin_dia, h = flap_t - flap_t_2);
translate([0,0,flap_t])
cylinder(d1=pin_dia*1.5,d2=pin_dia,h=flap_t-flap_t_2);
translate([0,0,flap_t]) cylinder(d=pin_dia,h=pin_h);
translate([0,0,pin_h+flap_t]) cylinder(d1=pin_dia+1.5, d2=pin_dia_2,h=3);
translate([0,0,pin_h+flap_t+3]) cylinder(d=pin_dia_2,h=pin_l-pin_h-flap_t-3);
translate([0,0,pin_l]) sphere(d=pin_dia_2);

