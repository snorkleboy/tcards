
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
            puts "see all(s)-see all \nwrite(w)- make new cards \nrandom(r) -randomly choose cards\nby topic(t) -choose cards by topic\nby unknown(u) -choose randomly biased towards unknown\n\n"
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
    def write()
        input = ''
        keys = @cards.keys.map{|key| key.to_i}
        p 'enter cards?(y/n)'
        input = gets.chomp
        while(input == 'y')
            card = getCard
            keys.push(keys[-1]+1)
            @cards[keys[-1]] = card
            p 'enter another card?(y/n)'
            input = gets.chomp
        end

        @writer.write(@cards) unless input == 'q'
    end
    def getCard()
        satisfied = false
        input = ''
        while (!satisfied && input != 'q')
            puts "enter question (tab enter to finish string)"
            question = gets("\t\n").chomp
            puts "enter answer (tab enter to finish string)"
            answer = gets("\t\n").chomp
            puts "enter how well you know it"
            know = gets.chomp
            input = {"question"=>question,"answer"=>answer,"know"=>know}    
            p input
            p "satisfied?(y/n)"
            if (gets.chomp == 'y')
                return input
            end
        end
    end
end


