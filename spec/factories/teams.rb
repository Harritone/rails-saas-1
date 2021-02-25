FactoryBot.define do
  factory :team do
    name { "MyString" }
    account { nil }
    timezone { "MyString" }
    has_reminder { false }
    has_recap { false }
    reminder_time { "2021-02-25 23:59:58" }
    recap_time { "2021-02-25 23:59:58" }
  end
end
