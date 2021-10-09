/**

**/
include <../roundedcube.scad>
//import("CarpenPi_1.svg");
//import(file = "CarpenPi_1.svg", center = true, dpi = 96);
 
xs=17.7;
ys=37.2;
zs=3.2;
fn=4;

difference() {
    difference() {
        translate([-1, 0, 1]) {
            //cube([xs+2, ys+3, zs+2], center=true);
            roundedcube([xs+2, ys+3, zs+2], center=true);
        }
        union() {
            cube([xs, ys, zs], center=true);
            translate([0, ys/2-1, 0]) {
                rotate([0, 90, 0]) {
                    cylinder(d=zs+.1,h=xs, center=true, $fn=fn);
                }
            }
            translate([0, -ys/2+1, 0]) {
                rotate([0, 90, 0]) {
                    cylinder(d=zs+.1,h=xs, center=true, $fn=fn);
                }
            }
        }
    }
    translate([-5, -5, 3]) {
        rotate([0, 0, 90]) {
            logo("CarpenPi_1.svg");
        }
    }
}

module logo(logo_file) {
    linear_extrude(height = 3) {
        scale(0.15)
        import(logo_file);
    }
}