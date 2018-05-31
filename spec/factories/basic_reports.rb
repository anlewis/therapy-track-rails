FactoryBot.define do
  factory :basic_report do
    oxygen 1
    temperature 1
    systolic 1
    diastolic 1
    notes "MyText"
    report nil
  end
end
