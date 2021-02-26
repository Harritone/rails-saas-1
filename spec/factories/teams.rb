FactoryBot.define do
  factory :team do
    name { "MyString" }
    account
    timezone { "Arizona" }
    has_reminder { false }
    has_recap { false }
    reminder_time { "2019-06-19 22:52:42" }
    recap_time { "2019-06-19 22:52:42" }
  end
end