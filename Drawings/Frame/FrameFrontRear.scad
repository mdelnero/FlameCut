include <Dimensions.scad>;
use <..\Hardware\SquareTube.scad>;

module FrameFrontRear()
{
	difference() 
   {
		SquareTube(_frameFrontWidth, _frameTubeWall, _frameFrontLength);
		
		// Front JunctionPlate
		translate([25,25,0]) 
			JunctionPlateDrillingPattern(_junctionPlateDrillingDiameter);			
		// Rear JunctionPlate
		translate([25,_frameFrontLength-75,0])
			JunctionPlateDrillingPattern(_junctionPlateDrillingDiameter);
	}		
}

module JunctionPlateDrillingPattern(diameter)
{
  translate([0,0,-10]) 
    cylinder(h=120, r=diameter/2);

  translate([50,0, -10]) 
    cylinder(h=120, r=diameter/2);

  translate([0, 50, -10]) 
    cylinder(h=120, r=diameter/2);

  translate([50,50, -10]) 
    cylinder(h=120, r=diameter/2);
}

FrameFrontRear();