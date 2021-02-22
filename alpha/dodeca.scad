m = 200;
r = 60;
k = 63;  /* near enough */

faces = [
    [0,0,0],
    [0,k,0],
    [0,k,72],
    [0,k,144],
    [0,k,216],
    [0,k,288],
    [0,180-k,36],
    [0,180-k,108],
    [0,180-k,180],
    [0,180-k,252],
    [0,180-k,324],
    [0,180,0]
];

font = "Comic Sans MS:style=Regular";

text = [
    ["what made", "you laugh", "today?"],
    ["what did", "you learn", "today?"],
    ["three", "three", "three"],
    ["four","4","44","444"],
    ["5 5", "5 5 5", "5 5 5 5 5", "5 5 5 5", "5"],
    ["6"],
    ["7"],
    ["8"],
    ["9"],
    ["10"],
    ["11"],
    ["12"],
];

intersection_for(n = [0:11]) {
    rotate(faces[n]) {
        translate([0,0,r-m/2]) {
            difference() {
                cube([m,m,m], center=true);
                rotate([0,0,90]) {
                    for (t = [0:len(text[n])]) {
                        y = (t - (len(text[n])/2) + 0.7) * -14;
                        translate([0,y,m/2]) linear_extrude(2, center=true) text(text[n][t], size=10, font=font, halign="center", valign="center");
                    }
                }
            }
        }
    }
}