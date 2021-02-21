# frozen_string_literal: true

ActiveAdmin.register Brand do
  permit_params :name

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
