//$fn=60;

difference() {
    sphere(d=50);
    sphere(d=30);
    rotate([0,0,45]) translate([-3,0,0]) linear_extrude(100, center=true) text("C", size=30, halign="center", valign="center", font="open sans extrabold");
    rotate([90,0,0]) linear_extrude(100, center=true) text("G", size=20, halign="center", valign="center", font="open sans extrabold");
    rotate([90,0,90]) linear_extrude(100, center=true) text("M", size=20, halign="center", valign="center", font="open sans extrabold");
}