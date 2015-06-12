#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory, :categories
	def initialize(name, cash, inventory, categories)
		@name = name
		@cash = cash
		@inventory = inventory
    @categories = categories 
	end

  def report_generator(inventory_by_color)
    inventory_by_color.execute(self)
  end

  def inventory_of_black_clothes_excluding_jeans_and_tshirts
    return 0 unless @categories['color'] == 'black' && @categories['garment_subtype'] != 'tshirt' && @categories['garment_subtype'] != 'jeans'
    @inventory
  end

  def inventory_by_color_and_less_than_amount(color, amount)
    return 0 unless @categories['color'] == color && @cash < amount
    @inventory
  end
end