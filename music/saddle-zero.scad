$fn=50;

sl = 60;  // saddle slot length
st = 2.8;   // saddle slot thick
ss = 4;   // saddle slot depth
sh = 1;   // saddle height above slot
sr = 0.25;  // saddle diameter

hull() {
    translate([0,0,ss/2]) cube([sl,st,ss], center=true);
    translate([0,0,ss+sh-sr]) rotate([0,90,0]) cylinder(h=sl, r=sr, center=true);
}