# Represents an administrative division in an organization
class Organization::ManagerialDepartment
	
	attr_reader :categories
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

	def generate_report(report)
		@sub_departments.each do |dept|
			dept.generate_report(report)
		end
	end

	def average_generate_report(report)
		generate_report(report)/report.count
	end

	def average_inventory
		inventory / @sub_departments.length
	end

	def inventory_of_black_and_not_jeans_or_t_shirts
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_black_and_not_jeans_or_t_shirts
		end
	end

	def inventory_of_men_t_shirts_or_women_scarfs
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_men_t_shirts_or_women_scarfs
		end
	end

	def inventory_by_colour_and_funding(colour, minimum_funds)
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_by_colour_and_funding(colour, minimum_funds)
		end
	end
end