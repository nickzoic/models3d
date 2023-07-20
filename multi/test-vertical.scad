colors = ["red", "orange", "yellow", "green", "aqua","blue","purple", "violet"];
angle = 360/len(colors);

module segment(m) {
    rotate([0,0,m*angle])
    rotate_extrude(angle=angle) 
    polygon([
        [8,0],
        [8,50],
        [10,50],
        [20,0]
    ]);
}

material = 0;
if (material == 0) {
    for (m = [0:len(colors)-1]) {
        color(colors[m]) segment(m);
    }
} else if (material <= len(colors)) {
    segment(material-1);
}