#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby -w
require_relative './flashcards.rb'
require_relative './util/pgAPI.rb'
require_relative './util/fileReaderAPI.rb'

cards = {}
writer = nil
begin
    if ARGV[0] == "-p"
        database,username,password = ARGV[1] == '-w' || ARGV[1]  == 'm' ? [nil,nil,nil] : ARGV[1..3] 
        pg = PGAPI.new(database,username,password)
        pg.migrateFromFile(ARGV[5]) if ARGV[4]  == '-m' || ARGV[1] == '-m'
        pg.writeFileFromPG(ARGV[5]) if ARGV[4]  == '-w' || ARGV[1] == '-w'
        cards= pg.getCards
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

