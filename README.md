# ship-project-cs4700

Ship project in Godot for CS 4700

## Run through Godot

on initial load of project for 1st time, Godot overwrites the project.godot
file from git which contains very important settings such as custom hotkeys,
and window/display settings.

1. `git clone git@github.com:Imacds/ship-project-cs4700.git`
1. open this project in Godot (tested with Godot 3.1)
1. close Godot
1. `git stash`
1. `git stash drop`
1. open the project again
3. click play (in top right; should have Root.tscn as default scene)

the closing, removing local change, and opening of the project should be fix to
Godot overwriting our project settings with its own vanilla defaults
