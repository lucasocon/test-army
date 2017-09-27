class UnitType
  attr_accessor :name, :points, :training_points, :training_cost, :transformation_cost, :transformation

  def initialize(name, points, training_points, training_cost, transformation_cost, transformation)
    @name = name
    @points = points
    @training_cost = training_cost
    @training_points = training_points
    @transformation_cost = transformation_cost
    @transformation = transformation
  end
end