class Team


  def initialize(name, matches_played = 0, matches_won = 0, matches_drawn = 0, matches_lost = 0, points = 0)
    self.name = name
    self.matches_played = matches_played
    self.matches_won = matches_won
    self.matches_drawn = matches_drawn
    self.matches_lost = matches_lost
    self.points = points
  end

  WINNER_POINT = 3
  LOSER_POINT = 0
  DRAW_POINT = 1

  attr_accessor :name, :matches_played, :matches_won, :matches_drawn
  attr_accessor :matches_lost, :points


  def won
    self.matches_played += 1
    self.matches_won += 1
    self.points += WINNER_POINT
  end

  def lost
    self.matches_played += 1
    self.matches_lost += 1
    self.points += LOSER_POINT
  end

  def drawn
    self.matches_played += 1
    self.matches_drawn += 1
    self.points += DRAW_POINT
  end

  def self.update_match(t1, t2, res)
    case res
    when "win"
      t1.won
      t2.lost
    when "draw"
      t1.drawn
      t2.drawn
    when "loss"
      t1.lost
      t2.won
    end
  end



  def self.compare_by_points_and_name(t1, t2)
    if t1.points == t2.points
      t1.name <=> t2.name
    else
      t2.points <=> t1.points 
    end
  end

end
