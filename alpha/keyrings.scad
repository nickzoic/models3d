/*
   Keyrings for Millie's 8th Birthday.
   
   License: CC-0 No Rights Reserved
   https://creativecommons.org/share-your-work/public-domain/cc0/
*/

module cloud(x) {
        
    difference() {

        union () {    
            linear_extrude(2) offset(r=x*3) children();
            linear_extrude(3) offset(r=-x) offset(r=x*3) children();
            color([1,1,0]) linear_extrude(4) offset(r=-x*2) offset(r=x*3) children();
        }
        translate([0,0,2]) linear_extrude(10) children();
    }
}

module keyring(kx, ky) {
   difference() {
      union() {
          color([1,0,0]) translate([kx,ky,0]) cylinder(h=4,d=10);
          children();
      }
      translate([kx,ky,-1]) cylinder(h=6,d=5, $fn=16);
   }
}

module present(name, ox, oy, kx, ky) {
    translate([ox,oy,0]) {
        keyring(kx, ky) {
            cloud(1.75) {
                text(name, size=12, font="URW Chancery L", valign="center");
            }
        }
    }
}
        


module keyrings1() {
present("Benjamin", 5, 10, -4, 0);
present("Charlotte", 5, 35, -4, 0);
present("Allanah", 5, 59, -3, 1);

present("Willow", 5, 83, -4, 0);
present("Shelby", 10, 106, -4, 0);
present("Elise", 63, 105, -4, -1);
present("Mya", 67, 50, -4, 0);
present("Amy", 65, 78, -3, 3);
present("Zac", 72, 24, -2, 2);
}
    
module keyrings2() {
present("Amelia", 5, 10, -3, 1);
present("Charlie", 5, 32, -4, 0);
present("Bianca", 5, 55, -4, 0);
present("Amber", 5, 77, -3, 0);
present("Isobel", 5, 100, -2, 0);
present("Dylan", 59, 20, -4, 0);
present("Caleb", 60, 45, -4, 0);
present("Chloe", 58, 70, -4, 0);
present("Kitty", 55, 96, -3, 0);
}

module keyrings3() {
present("Felix", 5, 10, -3, -1);
present("Betty", 5, 35, -4, 0);
present("April", 5, 62, -3, 1);
present("Rhonda", 5, 90, -3, 1);
}

module keyrings4() {
present("Alexander", 5, 10, -3, 1);
present("Charlotte", 6, 55.5, -4, 0);
present("Samantha", 4, 33, -2, 1);
present("Isabella", 4, 78, -2, 0);
present("Alannah", 5, 101, -3, 1);
rotate([0,0,90]) {
present("Alannah", 9, -80, -3, 1);   
present("Jett", 7, -103, -3, 0);
present("Jett", 45, -103, -3, 0);
}
present("Jack", 70, 99, -3, 0);
present("Ava", 64, 77, -3, 1);
}

module keyrings5() {
present("Lachlan", 3, 10, -2, 1);
present("Miller", 5, 32.5, -4, 0);
present("David", 5, 55, -4, 0);
present("Heidi", 5, 76.5, -4, 0);
present("Archie", 4, 99, -3, 1);
present("James", 5, 120, -4, 0);
present("Molly", 50, 85, -3, 0);
present("Liam", 65.5, 10, -2, 1);
present("Marcus", 55, 119, -4, 0);
rotate([0,0,90]) {
    present("Mrs. Pearson", 25.5, -99, -3, 0);
    present("Ryder", 30, -67, -3, 1);
}}

module keyrings6() {
    present("Caitlin", 5, 10, -4, 0);
    present("Christina", 5, 32.5, -4, 0);
    present("Aaron", 4, 54.5, -3, 1);
    present("Logan", 7, 74.5, -4, 2);
    present("Jackson", 56, 53.5, -4, 0);
    present("Alanah", 60, 9, -3, 1);
    present("Chelsea", 60, 76.5, -4, 0);
    present("Tyler", 77, 29.5, -4, 0);
    present("Emily", 5, 97, -4, 0);
    present("Spencer", 12, 119.5, -4, 0);
    present("Daniel", 56, 99, -4, 0);
    present("Finn", 72, 120, -4, 0);
}

module keyrings7() {
    present("Finn", 5, 10, -4, 0);
    present("Riley", 5, 33, -4, 0);
    present("Sienna", 50, 10, -4, 0);
    present("Angus", 51, 32, -4, 0);
    present("Jayda", 5, 59, -3, 1);
    present("Mr. Moroni", 5, 83, -3, 1);
    present("Miss M", 55, 56, -4, 0);
    present("Mr. Kapakoulakis", 5, 108, -4, 0);
}

module keyrings8() {
    rotate([0,0,90]) present("Mr. Kapakoulakis", 5, -5, -4, 0);
    present("Charlotte", 23, 10, -4, 0);
    present("Amelia", 24, 34, -4, 0);
    present("Betty", 28, 58, -4, 0);
    present("April", 24, 84, -4, 0);
    present("Felix", 24, 110, -4, 0);
}

    
intersection() {
    keyrings8();
    //cube([120,135,10]);
}
//present("Sienna", 5, 10, -3, 1);


//keyrings5();
