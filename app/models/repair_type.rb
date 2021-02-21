# frozen_string_literal: true

class RepairType < ApplicationRecord
  self.primary_key = :code
  alias_attribute :display_name, :code

  has_many :repairs, foreign_key: :repair_type_code, inverse_of: :repair_type, dependent: :restrict_with_error

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :duration, presence: true
  validates :duration, numericality: { greater_than: 0 }, if: :present?
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }, if: :present?
end
