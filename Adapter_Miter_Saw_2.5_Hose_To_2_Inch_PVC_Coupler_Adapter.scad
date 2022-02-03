
$fn=225;

fit = 0.35;
wallThickness = 3.5;

topSectionSize=61.087;
bottomSectionSize=63.5;

topSectionHeight = 31.75;
topOuter = topSectionSize-fit;
topInner = topOuter - wallThickness;

bottomSectionHeight = 50;
bottomOuter = bottomSectionSize - fit;
bottomInner = bottomOuter - wallThickness;

midSectionHeight = 20;


section(bottomSectionHeight,bottomInner,bottomOuter);  // Bottom section

translate([0,0,bottomSectionHeight]) angleSection(midSectionHeight,bottomInner,bottomOuter,topInner,topOuter); // joining piece

translate([0,0,bottomSectionHeight+midSectionHeight]) section(topSectionHeight, topInner, topOuter); // top section


module section(height=50, inner=63, outer=65) {
	
	difference() {
		cylinder(h=height,r1=outer/2,r2=outer/2);
		cylinder(h=height,r1=inner/2,r2=inner/2);
	}
		
}


module angleSection(height=50, startInner=101, startOuter=105,endInner=10,endOuter=20) {
	
	difference() {
		cylinder(h=height,r1=startOuter/2,r2=endOuter/2);
		cylinder(h=height,r1=startInner/2,r2=endInner/2);
	}

}