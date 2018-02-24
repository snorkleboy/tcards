#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby -w

require_relative './cards.rb'
require_relative './postgres/pgAPI.rb'
def getCardsFromFile(file)
    filePath = File.join(File.dirname(__FILE__),'/Cards.json')
    data = ''
    File.open(filePath, "r") do |f|
        f.each_line do |line|
            data.concat(line)
        end
    end
    JSON.parse(data)['cards']
end

def writeCardsToFile(cards)
    p 'to impliment'
end


cards = {}
p ARGV[0]
if ARGV[0] == "-p"
    PGAPI.new()
elsif ARGV[0] == '-f'
    p 'here'
    if ARGV[1]
        cards = getCardsFromFile(ARGV[1])
    else
        cards = getCardsFromFile('./Cards.json')
    end
else
    cards = getCardsFromFile('./Cards.json')
end


FlashCards.new(cards).start