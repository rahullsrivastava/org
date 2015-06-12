#Generates the report for a department based on colour
class Reports::InventoryByColour
  attr_reader :result, :count
  def initialize(colour)
    @count = 0
    @total = 0
    @colour = colour
  end

  def build(department)
    return unless department.colour == @colour
    @total += department.inventory
    @count += 1
  end

  def average
    return 0 if @count == 0
    @total/@count
  end
end