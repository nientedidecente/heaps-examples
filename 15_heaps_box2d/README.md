This example is using a newer version of `box2d` lib, you can find the code [here](https://github.com/openfl/box2d).

In order to use a subset of the classes locally avoiding the deprecated version on `haxelib`

To make it work you will need to follow those steps, make sure you are in this folder.
```
git clone https://github.com/openfl/box2d
mv box2d/box2D .
rm -rf box2d
```

now you can build it as usual.
```
haxe game.hxml
```


Alternatively you can follow the instructions on their readme:
```
Development Builds
Clone the Box2D repository:

git clone https://github.com/openfl/box2d
Tell haxelib where your development copy of Box2D is installed:

haxelib dev box2d box2d
To return to release builds:

haxelib dev box2d
```

and you will need to add
```
-lib box2d
```

on the `.hxml` file you will be using