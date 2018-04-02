# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to have_many(:messages) }
  it { is_expected.to validate_presence_of :name }
end
