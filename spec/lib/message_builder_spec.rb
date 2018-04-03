# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageBuilder do
  let(:message) { FactoryBot.create(:message) }
  subject { MessageBuilder.new(message) }

  describe 'build' do
    it 'builds a Mail::Message object' do
      expect(subject.build).to be_a Mail::Message
    end

    it 'sets the From header' do
      mail = subject.build
      expect(mail.header['From'].to_s).to match(/^"?[a-z\.' ]+"? <[^>]+@[^>]+>$/i)
    end

    it 'sets the To header' do
      mail = subject.build
      expect(mail.header['To'].to_s).to match(/^"?[a-z\.' ]+"? <[^>]+@[^>]+>$/i)
    end

    it 'sets the To header correctly for multiple recipients' do
      message.message_recipients << FactoryBot.build(:to_recipient, message: message)
      mail = subject.build
      expect(mail.header['To'].to_s).to match(/^("?[a-z\.' ]+"? <[^>]+@[^>]+>(, )?){2}$/i)
    end

    it 'sets the Cc header correctly when needed' do
      2.times { message.message_recipients << FactoryBot.build(:cc_recipient, message: message) }
      mail = subject.build
      expect(mail.header['Cc'].to_s).to match(/^("?[a-z\.' ]+"? <[^>]+@[^>]+>(, )?){2}$/i)
    end

    it 'sets the Subject header' do
      mail = subject.build
      expect(mail.header['Subject'].to_s).to eq message.subject
    end

    it 'does not set the Subject header when missing' do
      message.subject = ''
      mail = subject.build
      expect(mail.header['Subject'].to_s).to eq ''
    end

    it 'sets the textual content' do
      mail = subject.build
      expect(mail.text_part.to_s).to_not be_nil
    end

    it 'sets the html content' do
      mail = subject.build
      expect(mail.html_part.to_s).to_not be_nil
    end
  end
end
