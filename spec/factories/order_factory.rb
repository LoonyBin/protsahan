# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
      user
      item
      quantity 1
    end
end
