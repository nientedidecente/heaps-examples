class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var b:h2d.Anim;

	override function init() {
		var animationSpeed = 15;
		// Animations accepts an array of tiles
		// .split() will return an array of tiles,in this example cutting them every 10 pixel
		b = new h2d.Anim(hxd.Res.haxeLogo.toTile().split(10, false), animationSpeed, s2d);
		b.x = 250;
		b.y = 250;
	}
}
