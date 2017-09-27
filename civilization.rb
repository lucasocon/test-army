class Civilization
  attr_accessor :name, :unit_settings

  def initialize(name, unit_settings)
    @name = name
    @unit_settings = unit_settings
  end
end