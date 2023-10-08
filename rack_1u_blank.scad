use <lib/fillets2d.scad>;

ear_width = 15.875;
center_width = 450.85;
total_width = center_width + (ear_width * 2);
height_1u = 44.5;

// Hole info
hole_diameter = 7;
hold_radius = hole_diameter / 2;
hole_v_offset = 6.35;
hole_h_offset = (ear_width / 2);

linear_extrude(2.5) {
    difference() {
        // Main body
        rounding2d(2)
        fillet2d(1)
        square([total_width, height_1u]);

        // Top Holes
        y1 = hole_v_offset;
        hull() {
            translate([hole_h_offset + 1, y1]) 
                circle(d=hole_diameter);

            translate([hole_h_offset - 1, y1]) 
                circle(d=hole_diameter);
        }

        hull() {
            translate([total_width - (hole_h_offset + 1), y1]) 
                circle(d=hole_diameter);

            translate([total_width - (hole_h_offset - 1), y1]) 
                circle(d=hole_diameter);
        }

        // Middle Holes
        y2 = y1 + 15.875;
        hull() {
            translate([hole_h_offset + 1, y2])
                circle(d=hole_diameter);

            translate([hole_h_offset - 1, y2])
                circle(d=hole_diameter);
        }

        hull() {
            translate([total_width - (hole_h_offset + 1), y2])
                circle(d=hole_diameter);

            translate([total_width - (hole_h_offset - 1), y2])
                circle(d=hole_diameter);
        }

        // Bottom Holes
        y3 = y2 + 15.875;
        hull() {
            translate([hole_h_offset + 1, y3])
                circle(d=hole_diameter);

            translate([hole_h_offset - 1, y3])
                circle(d=hole_diameter);
        }

        hull() {
            translate([total_width - (hole_h_offset + 1), y3])
                circle(d=hole_diameter);

            translate([total_width - (hole_h_offset - 1), y3])
                circle(d=hole_diameter);
        }
    }
}

// Bottom "wing"
translate([ear_width + 10, 0, 0])
    cube([center_width - 20, 2.5, 10]);

// Top "wing"
translate([ear_width + 10, height_1u - 2.5, 0])
    cube([center_width - 20, 2.5, 10]);
