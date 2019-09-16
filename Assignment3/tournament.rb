require_relative 'team'


def solve(matches)
  teams_map = {}

  matches.each do |match|
    team1,team2,res = match.split(";")

    if !teams_map.has_key? team1
      teams_map[team1] = Team.new(team1)
    end

    if !teams_map.has_key? team2
      teams_map[team2] = Team.new(team2)
    end

    t1,t2 = teams_map[team1], teams_map[team2]

    Team.update_match(t1,t2,res)

  end

  teams = teams_map.values.sort { |t1, t2|  Team.compare_by_points_and_name(t1,t2) }

  puts "Team     | MP |  W  |  D  |  L  |  P"
  teams.each do |team|
    puts "#{team.name}   | #{team.matches_played}  |  #{team.matches_won}  |  #{team.matches_drawn}  |  #{team.matches_lost}  |  #{team.points}"
  end

end



input = [ "Team B;Team C;win",
          "Team A;Team D;draw",
          "Team A;Team B;win",
          "Team D;Team C;loss",
          "Team C;Team A;loss",
          "Team B;Team D;win" ]

solve(input)
