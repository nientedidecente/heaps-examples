import h2d.TileGroup;
import hxd.Key;
import hxd.App;

class Game extends hxd.App {
	static function main() {
		hxd.Res.initEmbed();
		new Game();
	}

	var char:h2d.Bitmap;
	var map:TileGroup;

	override function init() {
		var tile = h2d.Tile.fromColor(0x00ff00, 16, 16);
		map = new TileGroup(tile, null);

		for (i in 0...100) {
			map.add(Std.int(s2d.width * Math.random()), Std.int(s2d.height * Math.random()), tile);
		}

		char = new h2d.Bitmap(hxd.Res.load("haxeLogo.png").toImage().toTile(), s2d);
		char.x = 0.5 * s2d.width;
		char.y = 0.5 * s2d.height;

		char.tile = char.tile.center();
		char.scaleX = char.scaleY = 0.25;

		// Heaps provides us with a really easy to define and use developer console interface
		// https://heaps.io/api/h2d/Console.html
		var console = new h2d.Console(hxd.res.DefaultFont.get(), s2d);
		// this command is used to define the keybinding to toggle the developer console
		console.shortKeyChar = "`".charCodeAt(0);

		// you can also decided it to show it via the show() method
		console.show();

		// and make it pring some info like so
		console.log("Hello from console :)", 0xffffff);
		console.log("Warning!", 0xff0000);

		// you can add custom commands to your console, specifying functions to be invoked once thos commands are called
		// Functions can be specified to take different argument types
		// (Int, Float, String, Bool and even Enums):
		// The console ingame will suggest/autocomplete those commands.
		// https://heaps.io/api/h2d/Console.html#addCommand

		// Examples
		// 1. A commands to remove/add tiles (no arguments specified):
		console.addCommand("remove_tiles", "Remove all green tiles", [], function() {
			s2d.removeChild(map);
		});

		console.addCommand("add_tiles", "Add all green tiles back to the scene", [], function() {
			s2d.addChildAt(map, 0);
		});

		// you can also invoke those registerd commands from the code like so:
		console.runCommand("add_tiles");

		// 2. A command with mandatory parameters, 2 float coordinates in this example
		console.addCommand("move_logo", // Command string
			"Moves logo to specified position", // description
			[{name: "x", t: AFloat, opt: false}, {name: "y", t: AFloat, opt: false}], // Parameters expected
			function(x:Float, y:Float) { // function that will be invoked
				char.x = x;
				char.y = y;
			});

		// 3. A command with optional bool argument
		console.addCommand("show_logo", "Shows or hides logo", [{name: "visible", t: ABool, opt: true}], function(?visible:Bool = true) {
			char.visible = visible;
		});

		// you can also navigate the history of called commands using arrows
		// (while cursor is focused in console)

		// and you can also specify short alias name for your commands
		console.addAlias("mv", "move_logo");
	}
}
