# frozen_string_literal: true

DESCRIPTION_INDEX_LENGTH = 177
MOST_BROKEN_MACHINE_TYPES_AMOUNT = 3

ActiveAdmin.register Repair do
  permit_params :machine_type_code, :repair_type_code, :started_at, :description

  action_item :pdf_link, only: :show do
    link_to I18n.t('repairs.generate_pdf'), generate_pdf_admin_repair_path(resource)
  end

  member_action :generate_pdf do
    file_path = Repair::PdfGenerator.call(Repair.find(params[:id]))
    send_file file_path
  end

  sidebar :most_frequently_broken_machine_types, only: :index, priority: 0 do
    machine_types = MachineType::MostBrokenMachineTypes.call.limit(MOST_BROKEN_MACHINE_TYPES_AMOUNT)
    render partial: 'statistic', locals: { machine_types: machine_types }
  end

  index do
    selectable_column
    index_column
    column :machine_type
    column :repair_type
    column :started_at
    column(:description) { |resource| resource.description.truncate(DESCRIPTION_INDEX_LENGTH) }
    actions defaults: true do |resource|
      link_to I18n.t('repairs.generate_pdf'), generate_pdf_admin_repair_path(resource)
    end
  end
end
