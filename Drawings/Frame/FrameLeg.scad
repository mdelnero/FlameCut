include <Dimensions.scad>;
use <LegJunctionPlate.scad>;
use <..\Hardware\SquareTube.scad>;

_crossSectionOffset = (_frameTubeWidth-_legCrossSectionWidth)/2;

module FrameLeg()
{
	union()
	{
		union()
		{
			translate([0,_legFrontOffset,0]) 
				MakePart_Leg();
				
			translate([0,_legRearOffset,0])
				MakePart_Leg();

			translate([_crossSectionOffset,_legFrontOffset+_legWidth,-(_legLenght-_legCrossSectionHeight)])
				SquareTube(_legCrossSectionWidth, _frameTubeWall, _legCrossSectionLenght);
		}
	}
}

module JunctionPlateDrillingPattern(diameter)
{
  translate([0,0,60]) 
    cylinder(h=50, r=diameter/2);

  translate([80,0,60]) 
    cylinder(h=50, r=diameter/2);

  translate([0, 30, 60]) 
    cylinder(h=50, r=diameter/2);

  translate([80,30,60]) 
    cylinder(h=50, r=diameter/2);
}

module MakePart_Leg()
{
	difference() 
	{
		union()
		{
			translate([0,0,-_junctionPlateWall]) 
				rotate([-90,0,0])
					SquareTube(_legWidth, _junctionPlateWall, _legLenght);				
		
			translate([0,-30,-_junctionPlateWall]) 
				LegJunctionPlate();
		}

		// Cross Section Drilling Pattern
		rotate([0,90,0])
			translate([_legLenght-310,35,0]) 		
				JunctionPlateDrillingPattern(8);
	}
}

FrameLeg();