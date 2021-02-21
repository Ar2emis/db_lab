# frozen_string_literal: true

ActiveAdmin.register Repair do
  permit_params :machine_type_code, :repair_type_code, :started_at, :description
end
