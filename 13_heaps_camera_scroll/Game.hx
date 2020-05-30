import h2d.TileGroup;
import hxd.Key;
import hxd.App;

class Game extends hxd.App {
    // from Haxe 4.0 this is the correct way of setting constants
	public static final Speed = 10;

	static function main() {
		hxd.Res.initEmbed();

		new Game();
	}

	var camera:Camera;

    // char will be our "player"
	var char:h2d.Bitmap;
	var map:TileGroup;

	override function init() {
        // Camera is a local class check ./Camera.hx
		camera = new Camera(s2d);

		var tile = h2d.Tile.fromColor(0x00ff00, 16, 16);
		map = new TileGroup(tile, camera);

		for (i in 0...1000) {
			map.add(Std.int(s2d.width * Math.random()), Std.int(s2d.height * Math.random()), tile);
		}

		char = new h2d.Bitmap(hxd.Res.load("haxeLogo.png").toImage().toTile(), camera);
		char.x = 250;
		char.y = 250;

		char.tile = char.tile.center();
		char.scaleX = char.scaleY = 0.25;
	}

    // update will run at every frame
	override function update(dt:Float) {
        
        // here we check if the directional keys are pressed
        // and we change the char position accordingly
		if (Key.isDown(Key.LEFT)) {
			char.x -= Speed;
		} else if (Key.isDown(Key.RIGHT)) {
			char.x += Speed;
		}

		if (Key.isDown(Key.UP)) {
			char.y -= Speed;
		} else if (Key.isDown(Key.DOWN)) {
			char.y += Speed;
		}

        // And here we set the camera new coordinates in order for it to follow 
        // our player
		camera.viewX = char.x;
		camera.viewY = char.y;
	}
}
