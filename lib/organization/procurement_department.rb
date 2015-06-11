#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, cash, inventory, categories)
		@name = name
		@cash = cash
		@inventory = inventory
    @categories = categories
	end

  def custom_inventory(color_name)
    return @inventory if @categories['color'] == color_name 
    0
  end

  def custom_inventory_with_exclusion(color_name)
    return @inventory if @categories['color'] == color_name && @categories['garment_subtype'] != 'tshirt' && @categories['garment_subtype'] != 'jeans'
    0
  end
end