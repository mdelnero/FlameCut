include <Dimensions.scad>;
use <LegJunctionPlate.scad>;
use <..\Hardware\SquareTube.scad>;

_crossSectionOffset = (_frameTubeWidth-_legCrossSectionWidth)/2;

module Legs()
{
	union()
	{
		union()
		{
			translate([0,_legFrontOffset,0]) 
				MakePart_Leg();
				
			translate([0,_legRearOffset,0])
				MakePart_Leg();

			// Cross Tube Left
			translate([_crossSectionOffset,_legFrontOffset+_legWidth,-(_legLenght-_legCrossSectionHeight)])
				SquareTube(_legCrossSectionWidth, _frameTubeWall, _legCrossSectionLenght);
		}

		union()
		{		
			translate([_legWidth + _frameFrontLength,_legFrontOffset,0]) 
				MakePart_Leg();
				
			translate([_legWidth + _frameFrontLength,_legRearOffset,0]) 
				MakePart_Leg();

			// Cross Tube Right
			translate([_frameFrontLength+_legWidth+_crossSectionOffset,_legFrontOffset+_legWidth,-(_legLenght-_legCrossSectionHeight)])
				SquareTube(_legCrossSectionWidth, _frameTubeWall, _legCrossSectionLenght);
		}

		// Cross Tube Front
		translate([_legWidth-2,_legFrontOffset+_legCrossSectionWidth+_crossSectionOffset,-(_legLenght-_legCrossSectionHeight)])
			rotate([0,0,-90])		
				SquareTube(_legCrossSectionWidth, _frameTubeWall, _frameFrontLength+4);

		// Cross Tube Rear
		translate([_legWidth-2,_legRearOffset+_legCrossSectionWidth+_crossSectionOffset,-(_legLenght-_legCrossSectionHeight)])
			rotate([0,0,-90])		
				SquareTube(_legCrossSectionWidth, _frameTubeWall, _frameFrontLength+4);
	}
}

module MakePart_Leg()
{
	union()
	{
		translate([0,0,-_junctionPlateWall]) 
			rotate([-90,0,0])
				SquareTube(_legWidth, _junctionPlateWall, _legLenght);
	
		translate([0,-30,-_junctionPlateWall]) 
			LegJunctionPlate();
	}
}

Legs();