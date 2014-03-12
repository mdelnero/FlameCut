include <Dimensions.scad>;

module LegJunctionPlate()
{
	rotate([0,0,90])
		translate([0,-100,0])
		linear_extrude(_junctionPlateWall)
			import("LegJunctionPlate.dxf", "0");
}

LegJunctionPlate();