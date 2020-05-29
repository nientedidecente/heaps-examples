class MyShader extends hxsl.Shader {
	static var SRC = {
		// Base Shader we inherit from
		@:import h3d.shader.Base2d;
		// this will be used to define the shaders params
		@param var color:Vec4;
		// A simple fragment shader where we override the output colour
		function fragment() {
			output.color = color;
		}
	};
}

class MyShader2 extends hxsl.Shader {
	static var SRC = {
		@:import h3d.shader.Base2d;
		@param var color:Vec4;
		function fragment() {
			output.color += color;
		}
	};
}

class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var b:h2d.Bitmap;

	override function init() {
		b = new h2d.Bitmap(hxd.Res.haxeLogo.toTile(), s2d);
		var s = new MyShader();
		// setting the value of the shader param which we add on line 6
		s.color.set(1.0, 0.0, 0.0, 1.0);
		b.addShader(s);

        // adding the second shader to the object
		var s2 = new MyShader2();
		s2.color.set(0.0, 0.0, 1.0, 0.0);
        b.addShader(s2);

		b.x = 250;
        b.y = 250;
        
		b.tile = b.tile.center();
		b.rotation = Math.PI / 4;
	}

	override function update(dt:Float) {
		b.rotation += 0.01;
	}
}
