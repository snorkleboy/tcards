
require 'json'

class FlashCards
    def initialize(cards)
        @cards = cards
        @questions = @cards.keys
        @seenQuestions = []
        @questionsArray = true;
        @last = nil;
    end

    def start()
        input = ''
        puts 'welcome to Tcards\n'
        while input != 'q'
            puts "random(r) \nby topic(t) \nby unknown amount(u)\n\nonly r works for now"
            input = STDIN.gets.chomp
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
            puts "\n\n#{@cards[q]['question']}\n\n"
            input = gets.chomp()
            if (input == 'a')
                puts @cards[q]['answer']
            end
        end
        
    end

    def getmostUnseen()
        q = nil
        if (@questionsArray)
            q = @questions.slice!(rand(@questions.length))
            @seenQuestions.push(q)
            @questionsArray = !@questionsArray if (@questions.empty?)
            
        else
            q = @seenQuestions.slice!(rand(@seenQuestions.length))
            @questions.push(q)
            @questionsArray = !@questionsArray if (@seenQuestions.empty?)
        end
        return q
    end
end


