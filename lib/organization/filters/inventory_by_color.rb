#Filter the departments inventory by color
class InventoryByColor
  def initialize(requirement)
    @requirement = requirement
  end  

  def execute(department)
    puts department.categories['color']
    puts @requirement
    return 0 unless department.categories['color'] == @requirement 
    department.inventory
  end

end
