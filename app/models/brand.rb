# frozen_string_literal: true

class Brand < ApplicationRecord
  self.primary_key = :name

  has_many :machine_types, foreign_key: :brand_name, inverse_of: :brand, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
