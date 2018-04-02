# frozen_string_literal: true

# Shared behaviours for all models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
