# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageDeliverer do
  let(:message) { FactoryBot.create(:message_with_multiple_recipients) }
  subject { MessageDeliverer.new(message) }

  it 'instantiates multiple SMTP connections (one per host)' do
    hosts = message.recipient_emails.map { |r| r.split('@')[1] }.uniq

    expect(subject).to receive(:deliver_to).exactly(hosts.length).times

    subject.deliver
  end
end
