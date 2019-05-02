intersection() {
    //rotate([0,0,0]) translate([-3,0,0]) linear_extrude(100, center=true) text("M", size=40, halign="center", valign="center", font="open sans extrabold");
    rotate([90,0,0]) linear_extrude(100, center=true) text("M", size=40, halign="center", valign="center", font="open sans extrabold");
    union() {
    rotate([90,0,90]) translate([-0.54,0,0]) linear_extrude(100) text("N", size=40, halign="center", valign="center", font="open sans extrabold");
    rotate([90,0,-90]) translate([-0.54,0,0]) linear_extrude(100) text("N", size=40, halign="center", valign="center", font="open sans extrabold");
    }
}