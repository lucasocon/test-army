class BattleManager
  attr_accessor :results_battle
  GOLD = 100

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end

  def war
    if wins?
      save_battle(@attacker, @defender)
    elsif losses?
      save_battle(@defender, @attacker)
    elsif draw?
      results_to_draw
    end
    self
  end

  private

  def save_battle(winner, loser)
    @results_battle = Battle.new(winner, loser)
    sum_money(winner)
    delete_unit(loser)
  end

  def sum_money(army, gold = BattleManager::GOLD)
    GoldAdmin.new(army).sum(gold)
  end

  def delete_unit(army, count = 2)
    army.greater_delete_unit(count)
  end

  def wins?
    (@attacker.total_points > @defender.total_points)
  end

  def losses?
    (@attacker.total_points < @defender.total_points)
  end

  def draw?
    (@attacker.total_points == @defender.total_points)
  end

  def results_to_draw
    delete_unit(@attacker, rand(0..2))
    delete_unit(@defender, rand(0..2))
    sum_money(@attacker, rand(10..50))
    sum_money(@defender, rand(10..50))
    @results_battle = Battle.new( @attacker, @defender, true)
  end
end
