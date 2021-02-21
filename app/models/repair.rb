# frozen_string_literal: true

class Repair < ApplicationRecord
  belongs_to :machine_type, foreign_key: :machine_type_code, inverse_of: :repairs
  belongs_to :repair_type, foreign_key: :repair_type_code, inverse_of: :repairs

  validates :started_at, presence: true

  def name
    "#{Repair.to_s.humanize} ##{id}"
  end
end
