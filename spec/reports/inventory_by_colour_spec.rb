require 'spec_helper'
describe Reports::InventoryByColour do
	it "should return inventory of black clothes as 40" do
		department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
		inventory_report = FactoryGirl.build(:inventory_by_colour, colour: "black")
		department.generate_report(inventory_report)
    expect(inventory_report.result).to eq(40)
	end

	it "should return inventory of white clothes as 0" do
		department = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "white"})
		inventory_report = FactoryGirl.build(:inventory_by_colour, colour: "black")
		department.generate_report(inventory_report)
    expect(inventory_report.result).to eq(0)
	end

	it "should return inventory of black clothes as 100 for sub departments having black clothes where all are procurement departments" do
    sub_department1 = FactoryGirl.build(:procurement_department, inventory: 40, categories: {"colour" => "black"})
    sub_department2 = FactoryGirl.build(:procurement_department, inventory: 60, categories: {"colour" => "black"})
    department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
    inventory_report = FactoryGirl.build(:inventory_by_colour, colour: "black")
    department.generate_report(inventory_report)
    expect(inventory_report.result).to eq(100)
  end
end