# Tcards

##start
run tcards.rb, by default it will look for Cards.json to read from, otherwise you can call with -f flag and specify a file, or -p and specify a postgres db username password

#### flags
- -f read from file, should be followed by a filepath and optionally a -w flag to write a Cards.json file
- -p read from postgreSQL, should be followeed by db username passoword or for me uses default settings

##start options
on startup you will be presented with teh following options

- s see all questions and answers
- r randomly chooses questions, wont repeat until the list is fully asked
- w write new cards

## writing cards escape
to allow you to paste in adn write multi line answers hitting 'enter' (new line), will not end the string. you must end a line with 'tab' then press 'enter'