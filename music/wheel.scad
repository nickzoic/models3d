n = [ "C", "C♯ D♭", "D", "D♯ E♭", "E", "F",
    "F♯ G♭", "G", "G♯ A♭", "A", "A♯ B♭", "B" ];
m = [  "I", "", "ii", "", "iii", "IV",
    "", "V", "", "vi", "", "vii⁰", ];
o = [ "1", "m2", "M2", "m3", "M3", "4",
    "A4 d5", "5", "m6", "M6", "m7", "M7" ];

t = 3;

module wheel(id, od, s1, s2) {
    difference() {
        union() {
           cylinder(d1=od-t,d2=od,h=t/2, $fn=200);
           translate([0,0,t/2]) cylinder(d1=od,d2=od-t,h=t/2, $fn=200);
        }
        if (id>0) {
            union() {
               cylinder(d1=id-t,d2=id,h=t/2, $fn=200);
               translate([0,0,t/2]) cylinder(d1=id,d2=id-t,h=t/2, $fn=200);
            }
        }
        for (i= [0:11]) {
            rotate([0,0,i*-30])
                translate([0,od*0.45-t/2,t*2/3])
                    linear_extrude(3)
                        text(
                            s1[i],
                            size=od/5/(len(s1[i])+2),
                            halign="center",
                            valign="center",
                            font="noto"
                        );
            rotate([0,0,i*30])    
                translate([0,od*0.45-t/2,t*1/3])
                    rotate([0, 180, 0])
                    linear_extrude(3)
                        text(
                            s2[i],
                            size=od/5/(len(s2[i])+2),
                            halign="center",
                            valign="center",
                            font="noto"
                        );
            rotate([0,0,i*30+15])
                 translate([0,0,t])
                    rotate([0,45,0])
                        cube([1,od,1], center=true);
            rotate([0,0,i*30+15])
                 translate([0,0,0])
                    rotate([0,45,0])
                        cube([1,od,1], center=true);
                        
        }
    }
}

wheel(80, 100, n, n);
wheel(63, 79, m, n);
wheel(49, 62, n, o);
//wheel(0, 48, m, o);