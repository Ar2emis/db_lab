# frozen_string_literal: true

class MachineType
  class MostBrokenMachineTypes
    def self.call
      MachineType.joins(:repairs).select('machine_types.*', 'COUNT(repairs.*) as repairs_count')
                 .group(:code).order(repairs_count: :desc)
    end
  end
end
