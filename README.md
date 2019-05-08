# enva_2712's Dotfiles
This is a collection of my dotfiles. Ideas shamelesly stolen from [Zach Holman](https://github.com/holman/dotfiles), and [Chris Aumann](https://github.com/chr4/shellrc/).

## About
To deal with clutter and add some sense of modularity, all of the dotfiles are stored in stand alone collections. A collection should contain a `.links` file that describes where symbolic links should be created. 

## Installing
### Linking the dotfiles
The `script/link` script is used to automate the creation of symbolic links pointing to collection files. To link a `collection`, use `script/link <collection_name>`. More detail on the link script can be found with `script/link -h`
