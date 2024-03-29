
tolerance = .4;
rVac = 44.3/2 + tolerance;
rPlaner = 58/2 + tolerance;
thickness = 1.5;
taper = .5;
hTransition = 7;
hAdapter = 20;
hBottomAdapter = 30;

// bottom
translate([0,0,-(hBottomAdapter+hTransition)/2]) {
    difference() {
        cylinder(h = hBottomAdapter, r1 = rPlaner+thickness-3, r2 = rPlaner+thickness-taper, center = true);
        cylinder(h = hBottomAdapter, r1 = rPlaner-3, r2 = rPlaner-taper, center = true);
    };
}

// transition
difference() {
    cylinder(h = hTransition, r1 = rPlaner+thickness-taper, r2 = rVac+thickness-taper, center = true);
    cylinder(h = hTransition, r1 = rPlaner-taper, r2 = rVac-taper, center = true);
};

// top
translate([0,0,(hAdapter+hTransition)/2]) {
    difference() {
        cylinder(h = hAdapter, r1 = rVac+thickness-taper, r2 = rVac+thickness, center = true);
        cylinder(h = hAdapter, r1 = rVac-taper, r2 = rVac, center = true);
    };
}
// stop ring
translate([0,0,hTransition/2+1]) {
    difference() {
        cylinder(h = 2, r1 = rVac+thickness-taper, r2 = rVac+thickness-taper, center = true);
        cylinder(h = 2, r1 = rVac-taper, r2 = rVac-taper-1, center = true);
    };
}
