$fn=32; 
font = "FreeMono:style=Bold";

label = ["1", "2", "3", "4", "5", "6"];
size = 20;
edge = 2.5;

xlate = [[-1,0,0],[0,-1,0],[0,0,-1],[0,0,1],[0,1,0],[1,0,0]];
rot = [[0,-90,0],[90,0,0],[0,180,0],[0,0,0],[-90,0,0],[0,90,0]];
colors = ["red", "orange", "yellow", "green", "aqua","blue","purple", "violet"];

module body() {
    color(colors[7])
    minkowski() {
        cube(size-2*edge, center=true);
        sphere(r=edge);
    }
}

module face(n) {
    translate(xlate[n]*(size/2-1)) rotate(rot[n]) color(colors[n]) linear_extrude(1) text(label[n], font=font, size=(size-edge)*4/5, halign="center", valign="center");
}

material = 0;
if (material == 0) {
    body();
    for (i = [0:5]) {
        face(i);
    }
} else if (material <= len(label)) {
    face(material-1);
} else if (material == 7) {
    difference() {
        body();
        for (i = [0:5]) {
            face(i);
        }
    }
}