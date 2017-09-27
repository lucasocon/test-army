class Unit
  attr_accessor :level_training, :current_points, :unit_type, :army

  def initialize(army, unit_type)
    @unit_type = unit_type
    @army = army
    @level_training = 0
    calculate_points
  end

  def sum_level(level)
    @level_training += level
    calculate_points
  end

  def calculate_points
    @current_points = @unit_type.points + ( @unit_type.training_points * level_training )
  end

  def unit_transformation(unit_type)
    @unit_type = unit_type
    calculate_points
  end
end