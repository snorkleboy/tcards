
require 'json'

class FlashCards
    def initialize(cards,writer)
        @cards = cards
        @questions = @cards.keys
        @seenQuestions = []
        @questionsArray = true;
        @last = nil;
        @writer = writer
    end

    def start()
        input = ''
        puts 'welcome to Tcards\n\nq to quit\n'
        sleep(1.4)
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
        while (input != 'q')
             system "clear"
            puts "press a for answer and n for next question\n\n"
            q = getmostUnseen()
            puts "#{@cards[q]['question']}\n\n"
            input = gets.chomp()
            while (input != 'n')
                if (input == 'a')
                    puts @cards[q]['answer']
                    input = nil
                end
                if (input == 'q')
                    return
                end
                input = gets.chomp()
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


