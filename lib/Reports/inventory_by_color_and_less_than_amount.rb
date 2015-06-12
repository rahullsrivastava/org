class InventoryByColorAndLessThanAmount
  def initialize(color, amount)
    @color = color
    @amount = amount
  end  

  def execute(department)
    return 0 unless department.categories['color'] == @color && department.cash < @amount
    department.inventory
  end

end