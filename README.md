# heaps-examples
cloned-rebased translated fork of the russian Beeblerox/Simplest-Heaps-Examples

I did not directly fork this repo from the original one [Beeblerox/Simplest-Heaps-Examples](https://github.com/Beeblerox/Simplest-Heaps-Examples), I cloned it and rebased, in order to avoid having the full git history.


This small repo will be translating the examples and docs presented in this amazing set of examples in English from Russian.

## How To Run the examples

To run the single codebases you need to have `haxe` and `heaps` installed.
You will also need [Hashlink](https://hashlink.haxe.org/) to run the compiled bytecode.

If you are using VSCode, each folder exposes some tasks that will be executable from the IDE itself.

Alternatively, if you want to run them on your cli, you will just need to type the following commands:

```
cd 01_heaps_color_tile
haxe game.hxml
```
If everything is setup correctly you will obtain a `game.hl` file.

You will be able to run that file by just typing:

```
hl game.hl
```

### JS Examples
Some examples, like `./12_heaps_bitmap_font` have a 2 `.hxml` files, the `game.hxml` one will be used, as in the other examples to build an `hashlink` bytecode, the `js.hxml` instead is used to transpile the heaps game to a javascript file.

You can run it, after running the haxe compiler with
```
haxe js.hxml
```
by just opening the `index.html` file in the same folder, if this won't work try to feed the directory to a web server.

**Example**
```
python3 -m http.server --directory .
```

## How To Install Haxe and Hashlink

### Windows
COMING SOON

### Linux
COMING SOON

# Links
- [Heaps Docs](https://heaps.io/api/)
- [Heaps Docs - 2D](https://heaps.io/api/h2d/)
## DeepNight Tutorials
- [Install Haxe/Heaps](https://deepnight.net/tutorial/a-quick-guide-to-installing-haxe/)
- Using gameBase, haxe-heaps template [tutorial](https://deepnight.net/tutorial/using-my-gamebase-to-create-a-heaps-game/)
