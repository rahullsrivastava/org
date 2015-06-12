#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, cash, inventory, categories)
		@name = name
		@cash = cash
		@inventory = inventory
    @categories = categories
	end

  def inventory_by_color(color_name)
    return @inventory if @categories['color'] == color_name 
    0
  end

  def inventory_of_black_clothes_excluding_jeans_and_tshirts
    return @inventory if @categories['color'] == 'black' && @categories['garment_subtype'] != 'tshirt' && @categories['garment_subtype'] != 'jeans'
    0
  end

  def inventory_by_color_and_less_than_amount(color, amount)
    return @inventory if @categories['color'] == color && @cash < amount
  end
end