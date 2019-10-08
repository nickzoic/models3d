module subcube(level) {
    if (level > 0) {
       for (x = [-1:1:1]) {
          for (y = [-1:1:1]) {
              for (z = [-1:1:1]) {
                if ((x && y) || (y && z) || (x && z)) {
                    translate([x,y,z]) scale([1/3,1/3,1/3]) subcube(level-1);
                }
              }
           }
        }
    } else {
        cube(3, center=true);
    }
}

intersection() {
    translate([0,0,50]) cube([100,100,100],center=true);
    rotate([45,35.26,0]) scale([16.6,16.6,16.6]) subcube(3);
}