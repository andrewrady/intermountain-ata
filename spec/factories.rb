FactoryGirl.define do
  factory :missing_competitor do
    name "MyString"
    ring ""
  end

  factory :ring do
    id "1"
    ring_number "1"
    ring_rank "white-yellow"
    ring_age "18-29"
    ring_gender "women"
  end

  factory :user do
    email "test@test.com"
    password "dsfjgkhdfsg"
  end

end
