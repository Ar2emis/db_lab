# frozen_string_literal: true

ActiveAdmin.register RepairType do
  permit_params :code, :name, :duration, :price, :description

  form do |f|
    f.object.duration ||= 1
    f.object.price ||= 1.0

    f.semantic_errors
    f.inputs do
      f.input :code
      f.inputs
    end
    f.actions
  end
end
