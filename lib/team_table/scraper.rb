


class TeamTable::Scraper

    def initialize
            
    end
    

    def get_locations
        doc = Nokogiri::HTML(open("https://www.espn.com/soccer/table/_/league/eng.1"))
        clubs_names = doc.css(".Table.Table--align-right.Table--fixed.Table--fixed-left")
       
      
        @club_names_arr = []
        clubs_names.css(".hide-mobile").each do |club|
            @club_names_arr << club.text
            
        end
        
        club_data = doc.css(".Table__TR.Table__TR--sm.Table__even").css(".stat-cell")
       
       # goes in order: games played, won, drawn, lost, goals for, goals against, goal difference, points
       # 8 stats.  
       
       @club_data_arr = []
       club_data.each do |club|
        @club_data_arr.append(club.text)
        
        
       end
       @club_data_arr = @club_data_arr.each_slice(8).to_a
       
        
        @data_aggregate = []
        #iterate over 20 teams, then 8 spots in club_data for each team
        counter = 0
        while counter < 20
            @data_aggregate << [counter+1, @club_names_arr[counter], @club_data_arr[counter]]
            counter += 1
        end
        @data_aggregate
       
       
       
    end 
       
       
       
       
       
       
     
    def return_data
        @data_aggregate
    end

end