include <Dimensions.scad>;
use <LegCrossSectionPlate.scad>;
use <..\Hardware\SquareTube.scad>;

module LegCrossSection()
{
	length = _frameFrontLength-4;
	
	SquareTube(_legCrossSectionWidth, _frameTubeWall, length);		
	
	rotate([90,0,0])	
		translate([-5,-30,0])
			LegCrossSectionPlate();
			
	rotate([90,0,0])	
		translate([-5,-30,-(length+2)])
			LegCrossSectionPlate();
}

LegCrossSection();