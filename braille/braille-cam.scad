// all possible braille combinations as the wheel
// turns.

// worked out using a little python script
// which deletes all the repeated sequences
// until we get down to 64 which is obviously
// the minimum number ...

s = "0001002003011012013021022023031032033111211312212313213322232333";

d = 20;

difference() {
    cylinder(d=d,h=2, $fn=200);
    cylinder(d=d-2,h=3, $fn=200);
    }
for (n = [0:len(s)]) {
    rotate([0,0,n*360/len(s)]) translate([d/2,0,0]) {
    translate([0,0,0.6])
    if (s[n] == "1" || s[n] == "3") sphere(d=0.75, $fn=64);
    translate([0,0,1.4])
    if (s[n] == "2" || s[n] == "3") sphere(d=0.75, $fn=64);
    }
}
