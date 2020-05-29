import h2d.Bitmap;

class Game extends hxd.App {
	static function main() {
		new Game();
	}

	var b:h2d.Bitmap;

	override function init() {
		trace("Hello world!!!");

		b = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000, 60, 60), s2d);
		b.x = 50;
		b.y = 100;
		// calling .center on the tile will set an anchor point on the tile center.
		// All transformations operating on the tile will be calculated relatively its anchor.
		// By default the anchor point its set to be on the upper left corner.
		b.tile = b.tile.center();
		b.rotation = Math.PI / 4; // Rotation values needs to be provided in Radians
	}

	override function update(dt:Float) {
		b.rotation += 0.01;
	}
}
