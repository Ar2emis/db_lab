# frozen_string_literal: true

class MachineType < ApplicationRecord
  self.primary_key = :code
  alias_attribute :name, :code

  belongs_to :brand, foreign_key: :brand_name, inverse_of: :machine_types
  has_many :repairs, foreign_key: :machine_type_code, inverse_of: :machine_type, dependent: :restrict_with_error

  validates :code, presence: true, uniqueness: true
  validates :country, presence: true
  validates :manufactured_at, presence: true
  validates :manufactured_at, numericality: { greater_than: 0 }, if: :present?
end
