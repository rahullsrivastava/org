#Filter the departments inventory by color with no t-shirts and jeans
class InventoryOfBlackClothesExcludingJeansAndTshirts
  def initialize
    @requirement = 'black'
  end  

  def execute(department)
    return 0 unless department.categories['color'] == 'black' && department.categories['garment_subtype'] != 'tshirt' && department.categories['garment_subtype'] != 'jeans'
    department.inventory
  end

end
