class Army
  attr_accessor :gold, :civilization, :units, :battles
  DEFAULT_GOLD = 1000

  def initialize(civilization)
    @gold = Army::DEFAULT_GOLD
    @civilization = civilization
    @units = []
    @battles = []
    setting
  end

  def greater_subtract_unit(quantity)
    quantity.times { destroy_unit }
  end

  def attack(enemy)
    results = BattleManager.new(self, enemy).war.results_battle
    register_battle(results)
    enemy.register_battle(results)
  end

  def register_battle(battle)
    @battles << battle
  end

  def find_unit(unit_type)
    @units.each { |unit| return unit if unit.unit_type.name.to_s == unit_type }
    nil
  end

  def total_points
    units.inject(0) { |sum, u| sum + u.current_points }
  end

  def win_battle
    @battles.inject(0) { |sum, b| (b.wars_won == self) ? sum + 1 : sum }
  end

  def loss_battle
    @battles.inject(0) { |sum, b| (b.wars_lost == self) ? sum + 1 : sum }
  end

  private

  def destroy_unit
    unit = @units.max_by { |element| element.current_points }
    @units.delete(unit)
  end

  def setting
    @civilization.unit_settings.each do |setting|
      (1..setting.unit_quantity).each do
        units << Unit.new(self, setting.unit_type)
      end
    end
  end
end