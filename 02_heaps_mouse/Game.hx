class Game extends hxd.App {
	static function main() {
		new Game();
	}

	var b:h2d.Bitmap;

	override function init() {
		b = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000, 60, 60), s2d);
		b.x = 50;
		b.y = 100;
		b.tile = b.tile.center();
		b.rotation = Math.PI / 4;

		// Interactive object will handle mouse events. By default, they will be a rectangular area.
		// The third parameter is the object they will be attached to.
		// In this example i will handle mouse events for our tile b.
		var i = new h2d.Interactive(b.tile.width, b.tile.height, b);
        // since we centered the tile anchor, we would need to compensate aligning the Interactive
        // object the same amount.
		i.x = -0.5 * b.tile.width;
		i.y = -0.5 * b.tile.height;

		// Setting a couple of event hanlders
		i.onOver = function(_) b.alpha = 0.5;
		i.onOut = function(_) b.alpha = 1.0;
	}

	override function update(dt:Float) {
		b.rotation += 0.01;
	}
}
