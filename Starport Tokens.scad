// Starport RPG Tokens
// Patrick Wagstrom
// January 2025
//
// These are for the Starport role-playing game, published by Wider Path Games and licensed under the terms of the Attribution Non-Commercial Creative Commons License. These tokens make use of images from the PDF of the game, that were traced, and then saved as SVG to create something that works well for 3D printing.

// Parameters
medallion_diameter = 30; // Diameter of the medallion in mm
medallion_thickness = 3; // Total thickness of the medallion
border_thickness = 2;    // Width of the circular border
solid_base_thickness = 1.5; // Thickness of the solid base

// sneaky tokens
// svg_file = "sneaky.svg";

// smart tokens
// svg_file = "smart.svg";

// helpful tokens
// svg_file = "helpful.svg";

// tough tokens
svg_file = "tough.svg";


// energy tokens
// svg_file = "energy.svg";

// Medallion
module medallion() {
    union() {
        // Base circle
        cylinder(h = solid_base_thickness, r = medallion_diameter / 2, $fn = 100);

        // Circular border
        difference() {
            cylinder(h = medallion_thickness, r = medallion_diameter / 2, $fn = 100);
            translate([0, 0, -0.01]) // Offset to avoid Z-fighting
                cylinder(h = medallion_thickness + 0.02, r = (medallion_diameter / 2) - border_thickness, $fn = 100);
        };
    }
}

// SVG inlay, extruded and clipped to fit the medallion
module svg_inlay() {
    // Assume SVG is initially 1x1 units and scale to fit available area
    max_inlay_diameter = medallion_diameter - 2 * border_thickness;
    scale_factor = max_inlay_diameter / 1; // Assuming SVG is normalized
    
    intersection() {
        translate([-scale_factor/2, -scale_factor/2, solid_base_thickness]) {

            scale([scale_factor, scale_factor, 1]) {
                linear_extrude(height = medallion_thickness - solid_base_thickness)
                    import(file = svg_file);
            }
        };
        translate([0, 0, solid_base_thickness - 0.01]) {
        cylinder(h = medallion_thickness - solid_base_thickness + 0.02, r = (medallion_diameter / 2) - border_thickness, $fn = 100);
        }
        
    }
}

// Add reeds around the medallion
module reeds_negative() {
    num_reeds = 90;
    reed_width = 0.5;
    reed_height = medallion_thickness;
    union() {
        for (i = [0:num_reeds-1]) {
            angle = 360 / num_reeds * i;
            rotate([0, 0, angle]) {
                translate([medallion_diameter / 2, 0, reed_height/2]) {
                    cube([reed_width, reed_width, reed_height + 1], center = true);
                }
            }
        }
    }
}
    

// Combine everything
union() {
    difference() {
        union() {
            color("orange") medallion();
            color("white") svg_inlay();
        }
        reeds_negative();
    }
}
