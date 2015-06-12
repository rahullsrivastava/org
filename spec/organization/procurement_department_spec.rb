require "spec_helper"

describe Organization::ProcurementDepartment do
  context 'cash' do
  	it "should return cash  as 200 for a Procurement Department having funds as 200" do
  		department1 = FactoryGirl.build(:procurement_department, cash: 200)
  		expect(department1.cash).to eq(200)
  	end
  end

  context 'inventory' do
  	it "should return inventory  as 200 for a Procurement Department initialized with 200 products" do
  		department1 = FactoryGirl.build(:procurement_department, inventory: 200)
  		expect(department1.inventory).to eq(200)
  	end
  end

  context 'custom inventory' do
    it 'should return inventory size for black colot as 50 for a Department initialized with 50 inventory and category color as black' do
      department = FactoryGirl.build(:procurement_department, inventory:50, categories:{'color' => 'black'})
      expect(department.inventory_by_color('black')).to eq(50)
    end
  end

  context 'custom_inventory with exclusion' do
    it 'should return inventory size for black color as 0 for a Department initialized with 50 tshirt inventory and category color as black' do
      department = FactoryGirl.build(:procurement_department, inventory:50, categories:{'color' => 'black', 'garment_subtype' => 'tshirt'})
      expect(department.inventory_of_black_clothes_excluding_jeans_and_tshirts).to eq(0)
    end

    it 'should return inventory size for black color as 50 for a Department initialized with 50 sweatshirt inventory and category color as black' do
      department = FactoryGirl.build(:procurement_department, inventory:50, categories:{'color' => 'black', 'garment_subtype' => 'sweatshirt'})
      expect(department.inventory_of_black_clothes_excluding_jeans_and_tshirts).to eq(50)
    end

    it 'should return inventory size of 300 for department initialized with 300 yellow colored sweatshirts and 1000 funding' do
      department = FactoryGirl.build(:procurement_department, cash:1000, inventory:300, categories:{'color' => 'yellow'})
      expect(department.inventory_by_color_and_less_than_amount('yellow', 1200)).to eq(300)
    end

  end

end