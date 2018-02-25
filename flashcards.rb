
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
        puts "welcome to Tcards\n\nq to quit\n"
        while input != 'q'
            puts "See all(s)-see all \nWrite(w)- make new cards \nRandom(r) -randomly choose cards\n\n\n"
            input = STDIN.gets.chomp
            case input
                when 'r'
                    random()
                when 'w'
                    write()
                when 's'
                    see()
                else
                    input = 'q'
            end
        end
    end
    def see()
        @cards.each{|card| card=card[1]; puts "question:\n#{card['question']}\n\nanswer:\n#{card['answer']}\n\nknow:\n#{card['know']}\n\n\n" }
    end
    def random()
        input = ''
        while (input != 'q')
            system "clear"
            puts "press a for answer and n for next question\n\n"
            q = getmostUnseen()
            puts "#{@cards[q]['question']}\n\n"
            input = STDIN.gets.chomp()
            while (input != 'n')
                if (input == 'a')
                    puts @cards[q]['answer']
                    input = nil
                end
                if (input == 'q')
                    return
                end
                input = STDIN.gets.chomp()
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
    def write()
        input = ''
        keys = @cards.keys.map{|key| key.to_i}
        p 'enter cards?(y/n)'
        input = STDIN.gets.chomp
        while(input == 'y')
            card = getCard
            keys.push(keys[-1]+1)
            @cards[keys[-1]] = card
            p 'enter another card?(y/n)'
            input = STDIN.gets.chomp
        end

        @writer.write(@cards) unless input == 'q'
    end
    def getCard()
        satisfied = false
        input = ''
        while (!satisfied && input != 'q')
            puts "enter question (tab enter to finish string)"
            question = STDIN.gets("\t\n").chomp
            puts "enter answer (tab enter to finish string)"
            answer = STDIN.gets("\t\n").chomp
            puts "enter how well you know it"
            know = STDIN.gets.chomp
            input = {"question"=>question,"answer"=>answer,"know"=>know}    
            p input
            p "satisfied?(y/n)"
            if (STDIN.gets.chomp == 'y')
                return input
            end
        end
    end
end


