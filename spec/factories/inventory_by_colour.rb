FactoryGirl.define do
	factory :inventory_by_colour, class: Reports::InventoryByColour do
		colour ""
		initialize_with { new(colour) }
	end
end