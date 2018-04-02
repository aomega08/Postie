# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:message_recipients) }
  it { is_expected.to have_many(:recipients).through(:message_recipients) }

  it { is_expected.to validate_presence_of :from }

  it 'invokes the message deliverer after creation' do
    expect_any_instance_of(MessageDeliverer).to receive(:deliver)
    Message.create!(from: 'me@example.com')
  end

  it 'does not redeliver the message on an update' do
    expect_any_instance_of(MessageDeliverer).to receive(:deliver).once
    m = Message.create!(from: 'me@example.com')
    m.update(from: 'you@example.com')
  end
end
