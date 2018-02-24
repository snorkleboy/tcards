#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby -w
require_relative './flashcards.rb'
require_relative './util/pgAPI.rb'
require_relative './util/fileReaderAPI.rb'

cards = {}
writer = Proc.new{p 'no write proc provided'}
begin
    if ARGV[0] == "-p"
        # database,username,password = ARGV[1..3]
        pg = PGAPI.new()
        cards = PGAPI.getCards
        writer = pg
    else
        path = ARGV[1] || './Cards.json'
        # path = File.join(File.dirname(__FILE__),path)
        fr = FileReaderAPI.new(path)
        cards = fr.getCards
        writer = fr
    end
    FlashCards.new(cards,writer).start
rescue => exception
    p exception
end

