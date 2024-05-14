// wood dimensions

width = 50;
height = 25;

thick1 = 20;
thick2 = 3;

drill=6;
offs=(width-height)/2;

tsize=width/5;

difference() {
    translate([0,0,(width+thick1)/2]) cube([height+thick2*2, width, width+thick1], center=true);
    translate([0, 0, thick1+width/2]) cube([thick1, width+2, width+1], center=true);
    for (y=[offs,0, -offs]) {
        translate([0,y,-1]) cylinder(d=drill, h=thick1+2, $fn=64);
    }
    translate([0,0,width+thick1]) rotate([45,0,0]) cube([width*2, thick2, thick2], center=true);
    translate([0,width/2,width/2+thick1]) rotate([45,0,0]) cube([width*2, thick2, thick2], center=true);
    translate([0,-width/2,width/2+thick1]) rotate([45,0,0]) cube([width*2, thick2, thick2], center=true);
    
    translate([height/2+thick2-1,0,width/2]) rotate([90,0,90]) linear_extrude(1) text(str(width, "×", height), size=tsize, halign="center");
    translate([height/2+thick2-1,0,width/2+tsize*1.5]) rotate([90,0,90]) linear_extrude(1) text(str("Ø ", drill), size=tsize, halign="center");
    translate([height/2+thick2-1,0,width/2-tsize*1.5]) rotate([90,0,90]) linear_extrude(1) text(str(offs*2), size=tsize, halign="center");
    rotate([0,0,180]) {
    translate([height/2+thick2-1,0,width/2+tsize]) rotate([90,0,90]) linear_extrude(1) text(str("NM"), size=tsize*2, halign="center");
    translate([height/2+thick2-1,0,width/2-tsize]) rotate([90,0,90]) linear_extrude(1) text(str("1"), size=tsize, halign="center");
    }
    
}