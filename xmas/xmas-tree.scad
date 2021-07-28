$fn=50;

module tree() {
    intersection() {
        
        rotate([-9,0,0]) translate([-5.5,0,0]) {
            linear_extrude(height=4) {
                scale(0.2) import("xmas-tree2.svg");
            }
            linear_extrude(height=5) {
                scale(0.2) import("xmas-tree2a.svg");
            }
            linear_extrude(height=6) {
                scale(0.2) import("xmas-tree3a.svg");
            }
            linear_extrude(height=7) {
                scale(0.2) import("xmas-tree4a.svg");
            }
            linear_extrude(height=8) {
                scale(0.2) import("xmas-tree5a.svg");
            }
            linear_extrude(height=9) {
                scale(0.2) import("xmas-tree6a.svg");
            }
        }
        cube([45,55,10]);
    }
}

module tree_with_ring() {
    translate([-22.5,-26,0]) difference() {
        union() {
            translate([0,0,0]) tree();
            translate([22.25,50,0]) cylinder(h=2.8,d=6);
        }
        translate([22.25,50,0]) cylinder(h=3,d=4);
    }
}

module name(n, or, z) {
    translate([0,0,z]) {
        rotate([0,0,-90]) 
        linear_extrude(height=5) {
            offset(r=or) {
                text(n, font="URW Chancery L", size=40/len(n)+5, halign="center", valign="center");
            }
        }
    }
}

names = [
    "Alvin",
    "Yeonsok",
    "Eric",
    "Johnnie",
    "Dylan",
    "Adam",
    "Luke",
    "Mitchell",

    "Charlie",
    "James",
    "Andy",
    "Felicity",
    "Alannah",
    "Catalina",
    "Willow",
    "Eleni",

    "Chloe",
    "Daha",
    "Charlotte",
    "Amelia",
    "Alannah",
    "Leah",
    "Georgia",
    "Kayla",
    
    "Hayley",
    "Johnny",
    "Rhonda",
    "Leanne",
    "Rick",
    "Daniel",
    "Jen",
    "Charlotte",
];

name_offset = 24;

translate([22,31,0])
for (x = [0:3]) {
    for (y=[0:1]) {
        translate([x*27.5,y*55,0]) {
            rotate([0,0,x%2*180]) {
                translate([0,-3,0]) difference() {
                    union() {
                        tree_with_ring();
                        name(names[name_offset+x*2+y], 1, 0);
                    }
                    name(names[name_offset+x*2+y], 0, 1);
                }
            }
        }
    }
}
//cube([135,120,10]);