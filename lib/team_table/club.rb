class TeamTable::Club

    @@all = []

    attr_accessor :position, :name, :games_played, :won, :drawn, :lost, :goals_for, :goals_against, :difference, :points
    
    def initialize(position = nil, name = nil, games_played = nil, won = nil, drawn = nil, lost = nil, goals_for = nil, goals_against = nil, difference = nil, points = nil )
        @position = position
        @name = name
        @games_played = games_played
        @won = won
        @drawn = drawn
        @lost = lost
        @goals_for = goals_for
        @goals_against = goals_against
        @difference = difference
        @points = @won.to_i*3 + @drawn.to_i*1
        @@all << self
    end

    def self.table_builder(data_array)
       data_array.each do |club|

            self.new(club[0], club[1], club[2][0], club[2][1], club[2][2], club[2][3], club[2][4], club[2][5], club[2][6], club[2][7])
       end
       
    end 

    def self.all
        @@all
    end

    def self.find_club_by_index(pos)
       
        @@all[pos-1]
                    
                
    end



end