ActiveAdmin.register Vote do


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
    column :voted_picture_id
    column :campaign_id
    column :created_at
    actions
  end


  form do |f|
    f.inputs "Vote" do
      f.input :user_id
      f.input :voted_picture_id
      f.input :campaign_id
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end

  permit_params :user_id, :voted_picture_id, :campaign_id, :created_at, :updated_at



end
