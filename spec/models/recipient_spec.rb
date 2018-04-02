# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  it { is_expected.to have_many(:messages) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('test@example.com').for(:email) }
  it { is_expected.to allow_value('test@127.0.0.1').for(:email) }
  it { is_expected.to allow_value('test+alias@127.0.0.1').for(:email) }
  it { is_expected.to_not allow_value('test').for(:email) }
end
