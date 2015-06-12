#Generates the report for a department based on colour
class Reports::InventoryByColour
	def initialize(colour_name)
		@colour = colour_name
	end

	def generate_report(department)
		return 0 unless department.categories["colour"] == @colour
		department.inventory
		# inventory += department.generate_report(self)
	end
end