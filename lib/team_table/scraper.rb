


class TeamTable::Scraper

    def initialize
            
    end
    

    def get_locations
        doc = Nokogiri::HTML(open("https://www.espn.com/soccer/table/_/league/eng.1"))
        club_data = doc.css(".Table2__tr.Table2__tr--sm.Table2__even")
        

        @club_data_arr = []
        club_data.each do |club|
         if club.css(".hide-mobile").text != ""
            @club_data_arr << club.css(".hide-mobile").text
         end
        end
        
        @scores_data_arr = []
        club_data.each do |club|
            if club.css(".stat-cell").text != ""
            @scores_data_arr << club.text
            end
        end
        
        @data_aggregate = []
        counter = 0
        while (counter < 20)
            @data_aggregate << [counter + 1, @club_data_arr[counter], @scores_data_arr[counter]]
            counter += 1
        end

        @data_aggregate
     end
    def return_data
        @data_aggregate
    end

end