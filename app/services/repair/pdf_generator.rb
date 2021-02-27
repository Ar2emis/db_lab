# frozen_string_literal: true

class Repair
  class PdfGenerator
    STORAGE_PATH = 'storage'

    class << self
      def call(repair)
        Prawn::Document.generate(file_path(repair)) do
          text repair.name, size: 36, align: :center
          move_down(80)
          repair.attributes.each do |key, value|
            text "#{key.titleize}: #{value}", size: 14
            move_down(20)
          end
        end
        file_path(repair)
      end

      def file_path(repair)
        File.join(STORAGE_PATH, "#{repair.name}.pdf")
      end
    end
  end
end
