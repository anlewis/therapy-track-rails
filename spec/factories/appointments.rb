FactoryBot.define do
  factory :appointment do
    summary "MyString"
    location "MyString"
    description "MyText"
    start_time "2018-05-26 17:01:07"
    end_time "2018-05-26 17:01:07"
    user
  end
end
