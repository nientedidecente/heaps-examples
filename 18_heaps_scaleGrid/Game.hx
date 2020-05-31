import h2d.TileGroup;
import hxd.Key;
import hxd.App;

/**
 * ScaleGrid usage example.
 * https://heaps.io/api/h2d/ScaleGrid.html
 * ScaleGrid class implements https://en.wikipedia.org/wiki/9-slice_scaling scaling technique in Heaps.
 * The asset image was taken from Kenney's asset pack: https://opengameart.org/content/pixel-ui-pack-750-assets
 */
class Game extends hxd.App {
	static function main() {
		hxd.Res.initEmbed();

		new Game();
	}

	override function init() {
		var tile = hxd.Res.load("space.png").toImage().toTile();

		// First argument is tile itself, second argument is border width, the third argument is border height
		var scaleGrid = new h2d.ScaleGrid(tile, 2, 2, s2d);
		scaleGrid.width = 300;
		scaleGrid.height = 200;
		scaleGrid.x = scaleGrid.y = 100;
	}
}
