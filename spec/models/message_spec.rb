# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:message_recipients) }
  it { is_expected.to have_many(:recipients).through(:message_recipients) }

  it { is_expected.to validate_presence_of :from }
end
