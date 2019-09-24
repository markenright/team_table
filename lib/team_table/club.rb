class TeamTable::Club

    @@all = []

    attr_accessor :position, :name, :games_played, :won, :drawn, :points
    
    def initialize(position = nil, name = nil, games_played = nil, won = nil, drawn = nil, points = nil )
        @position = position
        @name = name
        @games_played = games_played
        @won = won
        @drawn = drawn
        @points = @won.to_i*3 + @drawn.to_i*1
        @@all << self
    end

    def self.table_builder(data_array)
        data_array.each do |index|
            self.new(index[0], index[1], index[2][0], index[2][1], index[2][2])
        end
    end 

    def self.all
        @@all
    end

    def self.find_club_by_index(pos)
        found_club = nil
        @@all.each do |club|
            if club.position == pos
                found_club = club
            end
        end
        found_club
                    
                
    end



end