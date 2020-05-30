class Game extends hxd.App {
	static function main() {
		hxd.Res.initEmbed();
		new Game();
	}

	var crosshair:h2d.Bitmap;

	override function init() {
		// sprites and sprites atlas are supported natively
		// https://heaps.io/api/hxd/res/Atlas.html
		// you only need to load the .atlas file
		var atlas:hxd.res.Atlas = hxd.Res.load("spineboy-pro.atlas").to(hxd.res.Atlas);

		// and specify the frame key on get
		var crosshairTile = atlas.get("crosshair");
		var fixedTile = atlas.get("eye-surprised");
		// this will return a tile you can assigne to a Bitmap
        
        // the order in which you add the bitmaps to the scene will
        // define the way they stack.
        // in this example the eye1 will be under the crosshair
        // which will be under eye2
        var eye1 = new h2d.Bitmap(fixedTile, s2d);
		crosshair = new h2d.Bitmap(crosshairTile, s2d);
		crosshair.tile = crosshair.tile.center();
        var eye2 = new h2d.Bitmap(fixedTile, s2d);
        
        // here we are placing the eyes somewhere around the center of the screen
		eye1.x = s2d.width * .5;
		eye1.y = s2d.height * .5;
		eye2.x = eye1.x - 100;
		eye2.y = eye1.y - 100;
	}

	override function update(dt:Float) {
		// those two lines will make the Bitmap follow your mouse position at every frame
		crosshair.x = s2d.mouseX;
		crosshair.y = s2d.mouseY;
	}
}
