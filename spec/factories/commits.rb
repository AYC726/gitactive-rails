# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    comment "MyString"
    sha "MyString"
    time "2013-12-02 21:35:30"
    user nil
    repo nil
  end
end
