include <Dimensions.scad>;

module JunctionPlate()
{
	rotate([0,0,90])
		translate([0,-90,0])
			linear_extrude(_junctionPlateWall)
				import("FrameJunctionPlate.dxf", "0");
}

JunctionPlate();