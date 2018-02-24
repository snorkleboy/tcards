
require 'json'

class FileReaderAPI
    def initialize(filepath)
        @filePath = filepath
    end

    def getCards
        FileReaderAPI.getCards(@filePath)
    end
    def self.getCards(file)
        data = ''
        File.open(file, "r") do |f|
            f.each_line do |line|
                data.concat(line)
            end
        end
        JSON.parse(data)['cards']
    end

    def write(cards)
        FileReaderAPI.write(@filepath,cards)
    end
    def self.write(file,cards)
        File.open(file,"w") do |f|
            f.write(cards.to_json)
        end
    end

end

