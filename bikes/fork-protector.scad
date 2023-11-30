$fn=100;

length = 100;
bore = 5;
outer_dia = 20;
drop_dia = 8;
drop_wid = 6;
drop_hei = 15;
base_wid = 30;

rotate([-90,0,0])
difference() {
union() {
cylinder(d=drop_dia, h=length+2*drop_wid);
translate([0,0,drop_wid]) cylinder(d1=outer_dia,d2=drop_dia,h=length/4);
translate([0,0,drop_wid+length*3/4]) cylinder(d2=outer_dia,d1=drop_dia,h=length/4);
translate([-drop_dia/2,0,0]) cube([drop_dia,drop_hei,length+2*drop_wid]);
translate([-base_wid/2,drop_hei,0]) cube([base_wid,5,length+2*drop_wid]);
}
translate([0,0,-1]) cylinder(d=bore,h=length+2*drop_wid+2);
}