# Tcards

## start
run tcards.rb, by default it will look for ./Cards.json to read from, otherwise you can call with -f flag to specify a file, or -p and specify a postgres db username password

#### flags
- -f read from filepath. by default the program will look for ./Cards.json. You can set a custom path with -f pathname
- -p read from postgreSQL, should be followeed by db username password. just -p will use default settings
- - '-p db username password -w ./othercards.json' can be used to write a json file from postgreSQL flashcards table
- - '-p db username password -m ./othercards.json' can be used to migrate and setup a postgres table from a file
- - I can omit the db username password to use default settings. 

## start options
on startup you will be presented with the following options

- s see all questions and answers
- r randomly chooses questions, wont repeat until the list is fully asked
- w write new cards

## writing cards escape
to allow you to paste in and write multi line question and answers without having to use \n, hitting 'enter' (new line), will not end the input. you must end a line with 'tab' then press 'enter' to finish your input
