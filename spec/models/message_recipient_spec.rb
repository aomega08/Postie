# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageRecipient, type: :model do
  it { is_expected.to belong_to :message }
  it { is_expected.to belong_to :recipient }
  it { is_expected.to define_enum_for(:recipient_type).with(%i[to cc bcc]) }
end
