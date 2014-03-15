include <Dimensions.scad>;

module LegCrossSectionPlate()
{
	linear_extrude(_junctionPlateWall)
		import("LegCrossSectionPlate.dxf", "0");
}

LegCrossSectionPlate();