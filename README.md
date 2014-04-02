shell-scripts
=============

my Shell-Scripts

## hdtest
* writes a tempfile using dd
* measures the consumed time
* prompts write and read speed in MB/s

usage:
`hdtest <size-of-tempfile> <destination>`
example:
`hdtest 1024 /mnt/HDD1`


## extjsMvcFolders
* creates the folder structure for a ExtJS 4 MVC Application

####usage:

`extjsMvcFolders.sh <destination> <ProjectName> [options]`

####Options:

Create a copy of an extJS folder in your application folder

`--create-ext /path/to/your/ExtJsSource`

