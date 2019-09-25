class TeamTable::CLI


   

    def initialize
        
    end


    def call
        puts "Hello and welcome to the Premier League, England's top soccer level!"
        
        menu
    end

    def menu
        puts "Type league to see the current league standings.  Type quit to leave or help for more info"
        while true
            input = gets.strip
            if input == "league"
                table_output
            elsif input == "help"
                help
            elsif input == "quit" or input == "exit"
                quit_program
            else
                "I'm sorry, please pick something else"
                menu
            end
        end
       
    end

    def table_output
        puts "The current standings in the Premier League:"
        puts 
        teams = TeamTable::Scraper.new
        teams_arr = teams.get_locations
      
        TeamTable::Club.table_builder(teams_arr)
        all_teams = TeamTable::Club.all
        all_teams.each do |team|
            puts "#{team.position} : #{team.name}"
        end
        
        
        puts "Select the club you would like more detailed info on by selecting its position on the table (1-20)"
        input = gets.strip
        input = input.to_i

        if input.between?(1, 20)
            more_info(input)
            
        else
            puts "sorry, that's not a valid league position"
            table_output
        end
    
         

    end

    def more_info(position)
        club = TeamTable::Club.find_club_by_index(position)
        puts
        puts "#{club.name} has won #{club.won} of #{club.games_played} matches and has #{club.points} points in total."
        puts "#{club.name} has scored #{club.goals_for} and conceded #{club.goals_against} for a goal difference of #{club.difference}"
        menu
    end
   

    def help
        puts "you can type league to see the current league standings" # location_options
        puts "you can type help to see this menu again" #help
        puts "or you can type quit to end this program"  #quit_program
        input = gets.strip
        case input
        when "league"
            table_output
        when "help"
            help
        when "quit"
            quit_program
        when "exit"
            quit_program
        else
            puts "I'm sorry, please pick something else"
            help
        end
    end

    

    def quit_program
        puts "Goodbye forever"
        exit!   
    end


end
