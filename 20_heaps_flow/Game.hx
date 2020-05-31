import h3d.mat.Material;
import hxd.App;

/**
 * h2d.Flow usage example.
 * Flow can be seen as a flexible container
 * https://heaps.io/api/h2d/Flow.html
 */
class Game extends hxd.App {
	static function main() {
		hxd.Res.initEmbed();
		new Game();
	}

	var flow:h2d.Flow;

	override function init() {
		flow = new h2d.Flow(s2d);
		// set flow direction
		// horizontal flow means that elements will placed horizontally until max width is reached
		flow.isVertical = false;
		// settin min and max width values
		flow.minWidth = 200;
		flow.maxWidth = s2d.width - 100;

		// setting multiline to true, will placed object that would overflow the maxWidth to the next line
		flow.multiline = true;
		flow.x = 0.5 * (s2d.width - flow.maxWidth);
		flow.y = 50;
		// setting flow alignment
		flow.horizontalAlign = Middle;
		flow.verticalAlign = Top;
		// setting the spacing between added objects
		flow.horizontalSpacing = 10;
		flow.verticalSpacing = 15;
		// setting the padding between objects and outer borders of the flow itself
		flow.padding = 10;

		// now we will add some objects to the Flow
		var tile = h2d.Tile.fromColor(0xffffff, 64, 64);
		for (i in 0...30) {
			var b = new h2d.Bitmap(tile);
			b.scaleX = b.scaleY = Math.random() + 1;
			b.color.set(Math.random(), Math.random(), Math.random());
			flow.addChild(b);
		}

        // loading an image from res and we set it to be our flow background image
		flow.backgroundTile = hxd.Res.load("space.png").toImage().toTile();
		// setting flow border, so we can see its outline drawn on screen
		flow.borderWidth = flow.borderHeight = 2;

		// Getting the properties of the first child element of our flow.
		// We use index of 1 because 0 (in this example) is the background border object.
		var flowProp = flow.getProperties(flow.getChildAt(1));
		if (flowProp != null) {
			// set align specific to this object
			flowProp.horizontalAlign = Left;
			flowProp.verticalAlign = Bottom;
		}

        // Now that we modified on item we need to calculate again all the positions
		flow.needReflow = true;
		flow.reflow();
	}

	override function update(dt:Float) {
		// here we change the size of the flow according to the mouse X coordinate
		flow.maxWidth = Std.int(s2d.mouseX - flow.x);
		// then we redraw it
		flow.reflow();
	}
}
