$fn=50;

sl = 60;  // saddle slot length
st = 2.8;   // saddle slot thick
ss = 4;   // saddle slot depth
sh = 0.75;   // saddle height above slot
sr = 0.15;  // saddle radius

xos = [ 0.5, 1.25, 1, 0.5 ];  // string offsets

xn = len(xos);
xl = sl / xn;

for (n = [0:xn-1]) {
    translate([-xl*n,0,0]) {
        hull() {
            translate([0,0,ss/2]) cube([xl,st,ss], center=true);
            #translate([0,xos[n],ss+sh-sr]) rotate([0,90,0]) cylinder(h=xl, r=sr, center=true);
        }
    }
}