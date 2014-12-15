ActiveAdmin.register Picture do


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
    column :file
    column :created_at
    column :updated_at
    actions
  end


  form do |f|
    f.inputs "Picture" do
      f.input :file
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end

  permit_params :file, :created_at, :updated_at



end
