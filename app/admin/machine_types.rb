# frozen_string_literal: true

ActiveAdmin.register MachineType do
  permit_params :code, :country, :manufactured_at, :brand_name

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :code
      f.inputs
    end
    f.actions
  end
end
