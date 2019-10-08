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

scale([50,50,50]) subcube(3);
