# ship-project-cs4700

Ship project in Godot for CS 4700
Intended to be a variation of Galaga

## Run through Godot

1. `git clone git@github.com:Imacds/ship-project-cs4700.git`
1. open this project in Godot (tested with Godot 3.1)
1. close Godot
3. click play (in top right; should have Root.tscn as default scene)


## Problems

Godot sometimes overwrites the project.godot
file from git which contains very important settings such as custom hotkeys,
and window/display settings, and presence of global scripts that're autoloaded.

fix by:

`git diff`

make sure the only changes were those that Godot made automatically to the project.godot file

`git stash && git stash drop`

the closing, removing local change, and opening of the project should be fix to
Godot overwriting our project settings with its own vanilla defaults
