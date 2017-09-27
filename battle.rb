class Battle
  attr_accessor :winner_army, :loser_army, :datetime, :draw

  def initialize(winner, loser, draw = false)
    @winner_army = winner
    @loser_army = loser
    @datetime = Time.now
    @draw = draw
  end

  def wars_won
    @winner_army unless @draw
  end

  def wars_lost
    @loser_army unless @draw
  end
end