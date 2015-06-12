require "spec_helper"

describe Organization::ManagerialDepartment do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do

  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department = FactoryGirl.build(:managerial_department, sub_departments:  [sub_department1, sub_department2, sub_department3])
  		expect(department.cash).to eq(30000.0)
  	end	

  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department2 = FactoryGirl.build(:procurement_department, cash: 10000)
  		sub_department3 = FactoryGirl.build(:procurement_department, cash: 10000)
  		department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
  		department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
  		expect(department2.cash).to eq(30000.0)
  	end	
  end   

  context 'Inventory' do
    it "should return remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 200)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 200)
      department = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(600)
    end 

    it "should return total remaining inventory of a Department as a sum of inventory in each of it's sub departments" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 300)
      sub_department3 = FactoryGirl.build(:procurement_department, inventory: 300)
      department1 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department1, sub_department2])
      department2 = FactoryGirl.build(:managerial_department, sub_departments: [sub_department3, department1])
      expect(department2.inventory).to eq(900)
    end

    it "should return average inventory as 500 when initialised with 2 procurement_department with inventory as 500 and 500" do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 500)
      sub_department2 = FactoryGirl.build(:procurement_department, inventory:500)
      department3 = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      expect(department3.average_inventory).to eq(500)
    end 

    it "should return number of black color inventories as 500 when initialised with 2 procurement_department white and black colored inventories of 250 each " do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 250, categories:{'color' => 'white'})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 250, categories:{'color' => 'black'})
      department = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      expect(department.inventory_by_color('black')).to eq(250)
    end

    it "should return number of black color inventories as 500 when initialised with 2 procurement_department black colored tshirt and sweatshirt inventories of 250 each " do
      sub_department1 = FactoryGirl.build(:procurement_department, inventory: 250, categories:{'color' => 'black', 'garment_subtype' => 'tshirt'})
      sub_department2 = FactoryGirl.build(:procurement_department, inventory: 250, categories:{'color' => 'black', 'garment_subtype' => 'sweatshirt'})
      department = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      expect(department.inventory_of_black_clothes_excluding_jeans_and_tshirts).to eq(250)
    end

    it "should return inventories as 250 when initialised with 2 procurement_department black colored tshirt and sweatshirt inventories of 250 each and 500 cash each" do
      sub_department1 = FactoryGirl.build(:procurement_department, cash: 500, inventory: 250, categories:{'color' => 'black'})
      sub_department2 = FactoryGirl.build(:procurement_department, cash: 550, inventory: 250, categories:{'color' => 'yellow'})
      department = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      puts department.inspect
      expect(department.inventory_by_color_and_less_than_amount('black', 600)).to eq(250)
    end

    it "should return inventories correct inventory for multilevel departments for inventory of specific color less than some amount" do
      sub_department1 = FactoryGirl.build(:procurement_department, cash: 700, inventory: 200, categories:{'color' => 'black'})
      sub_department2 = FactoryGirl.build(:procurement_department, cash: 900, inventory: 300, categories:{'color' => 'black'})
      department1 = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      sub_department1 = FactoryGirl.build(:procurement_department, cash: 800, inventory: 150, categories:{'color' => 'black'})
      sub_department2 = FactoryGirl.build(:procurement_department, cash: 950, inventory: 170, categories:{'color' => 'yellow'})
      department2 = FactoryGirl.build(:managerial_department, sub_departments:[sub_department1, sub_department2])
      department = FactoryGirl.build(:managerial_department, sub_departments:[department1, department2])
      expect(department.inventory_by_color_and_less_than_amount('black', 850)).to eq(350)
    end

  end   

end




