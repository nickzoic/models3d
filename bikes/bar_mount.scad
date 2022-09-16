// to make a flat, forward facing landing place for
// a headlight etc on these SQLabs 310 Sport bars.
$fn=32;

bd = 22.2;   // bar dia
br = -10;     // bar rise angle
bs = 16;     // bar sweep angle

ll = 20;
tt = 2.5;

module roundedcube(lx,ly,lz,cr) {
    hull() {
        for (sx=[-1,1]) for (sy=[-1,1]) for (sz=[-1,1]) {
            translate([sx*(lx/2-cr),sy*(ly/2-cr),sz*(lz/2-cr)]) sphere(r=cr);
        }
    }
}

difference() {
    hull() {
        rotate([0,0,-bs]) rotate([0,90-br,0]) {
            cylinder(h=tt, d1=bd, d2=bd+2*tt);
            translate([0,0,tt]) cylinder(h=ll, d=bd+2*tt);
            translate([0,0,ll+tt]) cylinder(h=tt, d1=bd+2*tt, d2=bd);
        }
        translate([ll/2,0,20]) roundedcube(ll+2*tt,bd,1,tt);
        //translate([0,0,25]) rotate([0,90,0]) cylinder(h=ll, d=bd);
    }  
    rotate([0,0,-bs]) rotate([0,90-br,0]) cylinder(h=100, d=bd, center=true);
    translate([ll/2,0,0]) cylinder(d=3,h=100,center=true);
    translate([ll/2,0,-5]) cylinder(d=8,h=40,center=true);
    
}


