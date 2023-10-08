use <fillets2d.scad>;

module rack_blank(u = 1, hole_diameter = 7) {
    // Constants
    ear_width = 15.875;
    hole_spacing = 15.875; // Same as ear width
    center_width = 450.85;
    height_1u = 44.5;
    hole_v_offset = 6.35;

    total_width = center_width + (ear_width * 2);
    hole_h_offset = (ear_width / 2);
    height = height_1u * u;

    linear_extrude(2.5) {
        difference() {
            // Main body
            rounding2d(2)
            fillet2d(1)
            square([total_width, height_1u * u]);

            // Mounting holes
            for (current_u = [0 : u]) {
                // For each U
                u_v_start = current_u * height_1u;
                max_hole_y = hole_v_offset + (hole_spacing * 2);
                for (hole_y = [hole_v_offset : hole_spacing : max_hole_y]) {
                    hull() {
                        translate([hole_h_offset + 1, u_v_start + hole_y]) 
                            circle(d=hole_diameter);

                        translate([hole_h_offset - 1, u_v_start + hole_y]) 
                            circle(d=hole_diameter);
                    }

                    hull() {
                        translate([total_width - (hole_h_offset + 1), u_v_start + hole_y]) 
                            circle(d=hole_diameter);

                        translate([total_width - (hole_h_offset - 1), u_v_start + hole_y]) 
                            circle(d=hole_diameter);
                    }
                }
            }
        }
    }

    // Bottom "wing"
    translate([ear_width + 10, 0, 0])
        cube([center_width - 20, 2.5, 10]);

    // Top "wing"
    translate([ear_width + 10, (height_1u * u) - 2.5, 0])
        cube([center_width - 20, 2.5, 10]);
}
