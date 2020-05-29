class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var g:h2d.Graphics;

	override function init() {
		// Graphics https://heaps.io/api/h2d/Graphics.html
		g = new h2d.Graphics(s2d);
		g.beginFill(0xff00ff, 0.5);
		// as the method suggests, we are drawing a circle of 100 pixel radius
		g.drawCircle(150, 150, 100);
	}

	override function update(dt:Float) {
		// binding RIGHT key to a positive x axis movement
		if (hxd.Key.isDown(hxd.Key.RIGHT)) {
			g.x += 10;
		}
		// binding LEFT key to a negative x axis movement
		else if (hxd.Key.isDown(hxd.Key.LEFT)) {
			g.x -= 10;
		}
	}
}
