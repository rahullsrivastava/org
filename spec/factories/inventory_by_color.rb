FactoryGirl.define do
  factory :inventory_by_color do
    requirements ""
    initialize_with { new(requirements) }
  end
end