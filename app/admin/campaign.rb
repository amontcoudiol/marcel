ActiveAdmin.register Campaign do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
index do
    selectable_column
    column :user_id
    column :picture_a_id
    column :picture_b_id
    column :status
    column :created_at
    column :updated_at
    actions
  end


  form do |f|
    f.inputs "User" do
      f.input :user_id
    end
    f.inputs "Pictures" do
      f.input :picture_a_id
      f.input :picture_b_id
    end
    f.inputs "Infos" do
      f.input :status
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end

  permit_params :user_id, :picture_a_id, :picture_b_id, :status, :created_at, :updated_at


end
