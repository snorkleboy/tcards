require 'pg'
require_relative './fileReaderAPI.rb'

class PGAPI

    def initialize(db="flashcards",user='snorkleboy',password='')
        @con = nil
        connect(db,user,password)
    end

    def connect(db,user,password)
        begin
            @con = PG.connect :dbname => db, :user => user, 
                :password => password
            
        rescue PG::Error => e
            puts e.message      
        end
    end
    def migrateFromFile(path = "./Cards.json")
        p 'this will overwrite the cards table, are you sure?(y)'
        return false if (STDIN.gets.chomp != 'y')
        p path
        cards = FileReaderAPI.getCards(path)
        @con.exec "DROP TABLE IF EXISTS Cards"
        @con.exec "CREATE TABLE Cards(id INTEGER PRIMARY KEY, question TEXT,answer TEXT, know INT)"
        cards.each_pair{|key, card|insert(key,card)}
    end

    def insert(key,card)
        sql=<<-SQL
                INSERT INTO Cards
                (id, question, answer,know)
                VALUES
                ($1,$2,$3,$4);
        SQL
        @con.exec_params sql ,[key, card['question'], card['answer'], card['know']]

    end

end


