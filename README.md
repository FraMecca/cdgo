cdgo
===
**cdgo** is a tool for fast navigation across folders.

The tool depends on [kv](http://francescomecca.eu:3000/pesceWanda/kv).

# Example usage

	$ pwd
	/home/user
	$ cdgo set home
	$ cdgo set work /home/user/work_dir
	$ cdgo list
	home: /home/user
	work: /home/user/work_dir
	$ cdgo work
	$ pwd
	/home/user/work_dir

	$ cdgo help
	Usage:
    help                   show this help message
    set [tag] [directory]  setup a checkpoint, if directory is not specified, the current folder is assumed
    delete [directory]     remove a previously registered checkpoint
    purge                  remove all the checkpoints
    [tag]                  go to the folder associated with the specified tag
