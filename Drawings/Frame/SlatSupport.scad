include <Dimensions.scad>;
use <..\Hardware\SquareTube.scad>;

module SlatSupport()
{
	union()
	{
		Side();
		
		translate([_slatWidth-_slatSheetWall,0,0])
				Side();
		
		for (i = [0:75:1125]) 
		{
			translate([1,i,0])
				Cross();
		}
		
		// Last Cross	
		translate([1,_slatLength-3,0])
			Cross();
	}
}

module Cross()
{
	cube([_slatWidth - _slatSheetWall, _slatSheetWall, _slatHeight]);
}

module Side()
{
	difference()
	{
		rotate([0,0,90])
			translate([0,-3,0])
				cube([_slatLength, _slatSheetWall, _slatHeight]);
				
		rotate([0,90,0])
		{
			translate([-20,36,-10]) 
			{
				for (i = [0:350:1050]) 
				{
					translate([0, i, 0]) 
						cylinder(h=20, r=4);
				}
			}
		}
	}			
}

SlatSupport();