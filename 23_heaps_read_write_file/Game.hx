import sys.io.File;
import sys.FileSystem;

class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	override function init() {
		var t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);

		// this file will be saved/loaded from the app current running directory
		var fileName = "data.txt";
		var readNum = 1;

		if (!FileSystem.exists(fileName)) {
			// if the file does not exist, we create it
			File.saveContent(fileName, 'this file was read ${readNum} time...\n');
			t.text = "I just created the data.txt file";
		} else {
			// if the file was there, we will read its contents, trace it and modify it a bit
			var content = File.getContent(fileName);

			t.text = 'File content:\n\n$content';
			var lines = content.split("\n").length;
			trace('we read from this file $lines times');
			readNum = lines;

			content = content + 'this file was read ${readNum} times...\n';
			File.saveContent(fileName, content);
		}
	}
}
