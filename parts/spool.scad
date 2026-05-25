// spool for sticky tape dispenser
// print sitting a little big diagonally, with support.

axd = 5;
axl = 33;
tid = 26;
inl = 23;

cylinder(h=axl, d=axd, center=true, $fn=32);

intersection() {
    cylinder(h=inl, d=tid, center=true, $fn=13);
    sphere(d=axl, $fn=26);
}
