class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();
		new Game();
	}

	var g:h2d.TileGroup;

	override function init() {
		// gridFlatten will split a tile into a list of tiles 10x10
		// https://heaps.io/api/h2d/Tile.html#gridFlatten
		var tiles = hxd.Res.haxeLogo.toTile().gridFlatten(10, 0, 0);
		// we create a TileGroup
		g = new h2d.TileGroup(tiles[0], s2d);
		// we disable blend mode (for performance purposes)
		g.blendMode = None;
		// and then we add to it other radom pieces of the initially split tile
		for (i in 0...1000) {
			g.add(Std.random(s2d.width), Std.random(s2d.height), tiles[i % tiles.length]);
		}
	}

	override function update(dt:Float) {
		g.rotation += 0.01;
	}
}
