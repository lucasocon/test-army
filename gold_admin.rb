class GoldAdmin
  def initialize(army)
    @army = army
  end

  def available?(gold)
    @army.gold > gold
  end

  def subtract(gold)
    @army.gold = @army.gold - gold if available?(gold)
  end

  def sum(gold)
    @army.gold = @army.gold + gold if available?(gold)
  end
end