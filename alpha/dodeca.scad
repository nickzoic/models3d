r = 30;
m = r*3;
k = 63;  /* near enough */
f = 5;

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
    ["how were", "you kind", "today?"],
    ["what did", "you work", "hard at", "today?"],
    ["what",  "was the",  "best part", "of your", "day?"],
    ["when were", "you brave", "today?" ], 
    ["how did", "someone", "help you", "today?"],
    ["who did", "you help", "today?"],
    ["what", "would make", "tomorrow", "great?"],
    ["what did", "you read", "about", "today?"],
    ["what made", "you feel", "proud?"],
    ["how were", "you helpful", "today?"],
];

intersection_for(n = [0:11]) {
    rotate(faces[n]) {
        translate([0,0,r-m/2]) {
            difference() {
                cube([m,m,m], center=true);
                rotate([0,0,90]) {
                    for (t = [0:len(text[n])]) {
                        y = (t - (len(text[n])/2) + 0.5) * -(f*1.4);
                        translate([0,y,m/2]) linear_extrude(bg, center=true) text(text[n][t], size=f, font=font, halign="center", valign="center");
                    }
                }
            }
        }
    }
}