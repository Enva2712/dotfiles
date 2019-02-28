# enva_2712's Dotfiles
This is a collection of my dotfiles. Ideas shamelesly stolen from [Zach Holman](https://github.com/holman/dotfiles), and [Chris Aumann](https://github.com/chr4/shellrc/).

## Installing
### Linking the dotfiles
The dotfiles are stored in _collections_; self contained directories containing an `.links` file that will be sourced by the `script/link` command.

The linking script follows the following specification
```
Usage: script/link [OPTION]... [COLLECTION]...
Install dotfile collections.
Example: script/link vim zsh

OPTIONS:
	-f
		Force linking by removing existing dotfiles.
	-a
		Install all collections. If this option is present, no collections should be provided.
COLLECTION:
	The name of a directory containing a .links file and contained under the collections folder.
```
