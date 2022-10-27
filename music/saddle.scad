$fn=50;

// XXX TODO allow for rounded corners on saddle slot
// using ye old rounded_cube()

sl = 60;  // saddle slot length
st = 2.9;   // saddle slot thick
ss = 4;   // saddle slot depth

sd = 2;       // saddle diameter
sx = 12.4;  // string spacing


// from https://www.liutaiomottola.com/formulae/compensation.htm
// actual compensation numbers are
// g = 1.43
// C = 2.87
// E = 1.86
// A = 1.22
// but there's some compensation in the bridge position already so this is a bit of a crapshoot

sn = 4;               // number of strings
shs = [ 1.8, 2, 2, 1.8];  // heights
sgs = [ 0.8, 1.1, 0.9, 0.8 ]; // groove diameter
scs = [ 0.5, 1.5, 1, 0.5 ]; // compensation for each string


  translate([0,0,-ss/2]) cube([sl, st, ss], center=true);

for (n = [0:sn-1]) {
  translate([(n - sn/2 + 0.5) * sx, 0, 0])
    difference() {
      hull() {
        translate([0,-scs[n],shs[n]-sd/2]) intersection() {
          rotate([0,90,0]) cylinder(sx/2, d=sd, center=true);
          translate([0,0,sd/2]) cube([sx/2, sd, sd], center=true);
        }
        translate([0,0,0.00005]) cube([sx, st, 0.0001], center=true);
      }
      translate([0,0,shs[n]+sgs[n]/2]) rotate([90,0,0]) cylinder(100, d=sgs[n], center=true);
  
    }
} 
        
