# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    from { Faker::Internet.email }
    from_name { Faker::Name.name }
    subject { Faker::Lorem.sentence }

    content { Faker::Lorem.paragraphs.join("\n\n") + '❤️' }
    html_content { '<p>' + Faker::Lorem.paragraphs.join('</p><p>') + '</p>' }

    after(:build) do |message|
      message.message_recipients << build(:to_recipient, message: message)
    end
  end
end
