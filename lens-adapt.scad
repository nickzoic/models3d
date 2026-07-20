// connect a " Canon EOS Camera Adapter Ring with M42 Lens to EF Lens/EOS Body Converter" to a CS extender tube

// canon adapter
cod = 66;    // outer diameter
cft = 1.4;   // flange thickness
cid = 55;    // internal diameter
ctt = 7;     // total thickness

cfr = 41;  // aperture ring
cfh = 2;   // aperture ring height

// cs adapter
akd = 32;   // knurled part diamter
akl = 5;   // knurled part length
asd = 30; // smooth part diamter
asl = 5;   // smooth part length
att = akl + asl;   // total length

// lens flange diameter
lfd = 35;

// flange distance M42 - CS
fd = 45.46 - 12.526;

// tripod thread insert size
tti = 20;
ttd1 = 8;
tth1 = 7; 
ttd2 = 6;
tth2 = 12;
ttd3 = 10;
tth3 = 2;

$fn=128;

difference() {
    hull() {
        cylinder(d=akd+10,h=att);
        translate([0,0,fd-ctt]) cylinder(d=cod+4,h=ctt);
        translate([0,0,fd-tti/2-1]) rotate([0,90,0]) cylinder(d=tti,h=cod/2+2);
    }
    translate([0,0,fd-cft]) cylinder(d=cod,h=cft+1);
    translate([0,0,fd-cft/2]) cylinder(d1=cod,d2=cod+1,h=cft/2);
    difference() {
        translate([0,0,fd-ctt]) cylinder(d=cid,h=ctt+1);
        translate([0,0,fd-ctt]) cylinder(d=cfr,h=cfh);
    }
    translate([0,0,-1]) cylinder(d=asd,h=asl+2);
    translate([0,0,asl-1]) cylinder(d1=asd,d2=asd+2);
    translate([0,0,asl]) cylinder(d1=akd,d2=lfd,h=akl);
    translate([0,0,att]) cylinder(d=lfd,h=fd-att);
    
    translate([cod/2+2-tth1,0,fd-tti/2-1]) rotate([0,90,0]) cylinder(d1=ttd1,d2=ttd1+1, h=tth1);
    translate([cod/2+2-tth2,0,fd-tti/2-1]) rotate([0,90,0]) cylinder(d=ttd2, h=tth2);
    translate([cod/2+2-tth3,0,fd-tti/2-1]) rotate([0,90,0]) cylinder(d=ttd3, h=tth3);
    translate([cod/2+1,ttd3/2,fd-tti/2-1]) rotate([90,0,90]) linear_extrude(2) text("3", size=5, valign="center");
    //cube(100);
    //cylinder(d=100,h=25);
}
