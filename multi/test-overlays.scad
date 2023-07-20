colors = ["red", "orange", "yellow", "green", "aqua","blue","purple", "violet"];
size = 10;

module stripe(m) {
    color(colors[m]) {
        translate([m*size,0,0]) cube([size,len(colors)*size,1]);
        translate([0,m*size,1]) cube([size*len(colors),size,0.5]);
    }
}

material = 0;
if (material == 0) {
    for (m = [0:len(colors)-1]) {
        stripe(m);
    }
} else if (material <= len(colors)) {
    stripe(material-1);
}