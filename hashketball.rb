# Write your code here!
require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
    },
    "Brendan Haywood" => {
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
    }
    }
  }
}
game_hash
end

# Build a method, num_points_scored that takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player)
          return game_hash[location][attribute][player][:points]
      end

        end
    end
  end

# Build a method, shoe_size, that takes in an argument of a player's name and returns the shoe size for that player.
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player)
          return game_hash[location][attribute][player][:shoe]
      end
        end
    end
  end

# Build a method, team_colors, that takes in an argument of the team name and returns an array of that teams colors.
def team_colors(team_name)
  game_hash.each do |location, team_data|
      if game_hash[location].values.include?(team_name)
        team_data.each do |attribute, data|
          if attribute == :colors
            return data
          end
        end
      end
  end
end

# Build a method, team_names, that operates on the game hash to return an array of the team names.
# def team_names
#   name_array = []
#   game_hash.each do |location, team_data|
#     team_data.each do |attribute, data|
#       if attribute == :team_name
#         name_array << data
#       end
#     end
#   end
#   name_array
# end
def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

# Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.
def player_numbers(name)
  array = []
  game_hash.each do |location, team_data|
      if team_data[:team_name] == name
        team_data[:players].each do |player_name, value|
          array << value[:number]
        end
      end
    end
    array
end


#  Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(player_name)
  statlist = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_stats|
          if name == player_name
            statlist = player_stats
          end
      end
      end
    end
  end
  statlist
end

# Build a method, big_shoe_rebounds, that will return the number of rebounds associated with the player that has the largest shoe size.
def big_shoe_rebounds
  big_shoe = 0
  rebounds = nil
  # player_name = "Brook Lopez"
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_stats|
            if big_shoe < player_stats[:shoe]
              big_shoe = player_stats[:shoe]
              rebounds = game_hash[location][:players][name][:rebounds]
            end
        end
      end
    end
  end
  rebounds
end


###########
def most_points_scored #return player with most points scored
    biggest_score = 0
    biggest_player = ""
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if stats[:points] > biggest_score
                biggest_score = stats[:points]

               biggest_player = player
            end
        end
    end
    return biggest_player
end

def winning_team #return team with most points
    home_points = 0
    away_points = 0
    game_hash[:home][:players].map do |player, stats|
        home_points += stats[:points]
    end
    game_hash[:away][:players].map do |player, stats|
        away_points += stats[:points]
    end

    if home_points > away_points
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name_person = ""
    longest_name_length = 0
    game_hash.map do |location, team_data|
        team_data[:players].map do |player, stats|
            if player.length >= longest_name_length
                longest_name_length = player.length
                longest_name_person = player
            end
        end
    end
    return longest_name_person
end

#############################

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = nil
  most_steals_player = ""
  game_hash.collect do |location, team_data|
    team_data[:players].collect do |player, stats|
      if stats[:steals] > most_steals
          most_steals = stats[:steals]
          most_steals_player = player
      end
      if longest_name == most_steals_player
      end
    end
  end
end
