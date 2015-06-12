# Represents an administrative division in an organization
class Organization::ManagerialDepartment
	
	def initialize(department_name, sub_departments, categories)
		@name = department_name
		@sub_departments = sub_departments
		@categories = categories
	end

	def cash
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.cash 
		end
	end

	def inventory
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory 
		end
	end

	def average_inventory
		inventory/@sub_departments.length
	end

	def inventory_by_color(color)
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_by_color(color) 
		end
	end

	def inventory_of_black_clothes_excluding_jeans_and_tshirts
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_black_clothes_excluding_jeans_and_tshirts
		end
	end

	def inventory_by_color_and_less_than_amount(color, amount)
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_by_color_and_less_than_amount(color, amount)
		end
	end

end