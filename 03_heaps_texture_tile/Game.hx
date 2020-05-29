class Game extends hxd.App {
	static function main() {
		// this will initialize all the assets from the ./res folder
		// so you will be able to load them on demand
		hxd.Res.initLocal();

		new Game();
	}

	var b:h2d.Bitmap;

	override function init() {
		// There are two ways of loading assets from Res
		// the first one is to use the asset name as property
		// b = new h2d.Bitmap(hxd.Res.haxeLogo.toTile(), s2d);
		// the second is to pass the full filename to the load() function
		b = new h2d.Bitmap(hxd.Res.load("haxeLogo.png").toImage().toTile(), s2d);
		b.x = 250;
		b.y = 250;
		b.tile = b.tile.center();
		b.rotation = Math.PI / 4;
	}

	override function update(dt:Float) {
		b.rotation += 0.01;
	}
}
