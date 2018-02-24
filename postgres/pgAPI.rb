
require 'pg'
class PGAPI

    def initialize(db="flashcards",user='snorkleboy',password='')
        connect(db,user,password)
    end

    def connect(db,user,password)
        begin
            con = PG.connect :dbname => db, :user => user, 
                :password => password

            user = con.user
            db_name = con.db
            pswd = con.pass
            
            puts "User: #{user}"
            puts "Database name: #{db_name}"
            puts "Password: #{pswd}" 
            
        rescue PG::Error => e
            puts e.message     
        ensure
            con.close if con      
        end
    end

end


