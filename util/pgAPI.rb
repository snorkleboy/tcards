require 'pg'
class PGAPI

    def initialize(db="flashcards",user='snorkleboy',password='')
        connect(db,user,password)
    end

    def connect(db,user,password)
        begin
            con = PG.connect :dbname => db, :user => user, 
                :password => password
            
        rescue PG::Error => e
            puts e.message     
        ensure
            con.close if con      
        end
    end

end


