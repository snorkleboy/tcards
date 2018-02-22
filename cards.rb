
require 'json'

class FlashCards
    def initialize(cards)
        @cards = cards
        @questions = @cards.keys
        @seenQuestions = []
        @questionsArray = true;
        @most = 0
    end
    def start()
        input = ''
        puts 'welcome to Tcards'
        while input != 'q'
            puts 'random(r) \nby topic(t) \nby unknown amount\n\n only r works for now'
            input = gets.chomp
            case input
                when 'r'
                    random()
                else
                    input = 'q'
            end

        end
    end
    def random()
        input = ''
        puts 'press a for answer and next question q to quit'
        while (input != 'q')
            q = getmostUnseen()
            p '','',q,'','',''
            input = gets.chomp()
            if (input == 'a')
                puts @cards[q]
            end
        end
        
    end

    def getmostUnseen()
        q = nil
        if (@questionsArray)
            q = @questions.pop()
            @seenQuestions.push(q)
            @questionsArray = !@questionsArray if (@questions.empty?)
            
        else
            q = @seenQuestions.pop()
            @questions.push(q)
            @questionsArray = !@questionsArray if (@seenQuestions.empty?)
        end
        return q
    end
end


filePath = File.join(File.dirname(__FILE__),'/Cards.json')
data = ''
File.open(filePath, "r") do |f|
  f.each_line do |line|
    data.concat(line)
  end
end
cards = JSON.parse(data)['cards']
FlashCards.new(cards).start





# while (line = fileObj.gets)
#   puts(line)
# end
# fileObj.close