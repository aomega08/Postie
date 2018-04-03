FactoryBot.define do
  factory :to_recipient, class: MessageRecipient do
    message
    recipient
    recipient_type :to

    factory :cc_recipient do
      recipient_type :cc
    end

    factory :bcc_recipient do
      recipient_type :bcc
    end
  end
end
