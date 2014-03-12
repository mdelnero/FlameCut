include <Dimensions.scad>;
use <..\Hardware\SquareTube.scad>;

module FrameSide()
{
   difference() 
   {
		SquareTube(_frameSideWidth, 2, _frameSideLength);
		
		// Front JunctionPlate Drilling
		translate([25,25,0]) 
			JunctionPlateDrillingPattern(_junctionPlateDrillingDiameter);	
		
		// Rear JunctionPlate Drilling
		translate([25,_frameSideLength-75,0])
			JunctionPlateDrillingPattern(_junctionPlateDrillingDiameter);

		// Front Legs Drilling
		translate([25,115,0]) 
			LegsDrillingPattern(_legsPlateDrillingDiameter);

		// Rear Legs Drilling
		translate([25,_frameSideLength-250,0]) 
			LegsDrillingPattern(_legsPlateDrillingDiameter);

		// Rack Drilling
		rotate([0,90,0])
			translate([-27, 200, -10]) 
				RackDrillingPattern(_rackDrillingDiameter);	
	
		// Linear Guide Drilling
		rotate([0,90,0])
			translate([-70, 160, -10]) 
				LinearGuideDrillingPattern(_linearGuideDrillingDiameter);
	}

	// Support
	// TODO: Use _frameSideLength and _frameSideWidth as input
	translate([100, 275, 50])
	{
		for(y = [0, 350, 700, 1050])
		{
			translate([0, y, 0])
				MakePart_GrillSupport();
		}				
	}
}

module LegsDrillingPattern(diameter)
{
  translate([0,0,-10]) 
    cylinder(h=20, r=diameter/2);

  translate([50,0, -10]) 
    cylinder(h=20, r=diameter/2);

  translate([0, 130, -10]) 
    cylinder(h=20, r=diameter/2);

  translate([50,130, -10]) 
    cylinder(h=20, r=diameter/2);
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

module RackDrillingPattern(diameter)
{	
	for(y = [0, 300, 600, 900, 1200])
	{
		translate([0,y,0])
			cylinder(h=20, r=diameter/2);
	}
}

module LinearGuideDrillingPattern(diameter)
{	
	for(y = [0, 60, 180, 300, 420, 540, 660, 780, 900, 1020, 1140, 1260, 1380])
	{
		translate([0,y,0])
			cylinder(h=20, r=diameter/2);
	}
}

module MakePart_GrillSupport()
{
	translate([0,-12.5,-25]) 
	difference() 
	{
		cube([25, 25, 50]);

		translate([0,0,2]) 
			cube([23, 25, 46]);

		translate([0,12.5,25])
			rotate([0,90,0])
				cylinder(h=40, r=4);		
	}
}

//translate([_frameTubeWidth,0,0]) mirror([1,0,0]) 
	FrameSide();