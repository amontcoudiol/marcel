ActiveAdmin.register User do


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
    column :id
    column :first_name
    column :last_name
    column :gender
    column :email
    column :created_at
    column :last_sign_in_at
    column :admin
    actions
  end


  form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :birthday
      f.input :email
      f.input :city
    end
    f.inputs "Target" do
      f.input :target_min_age
      f.input :target_max_age
      f.input :target_gender

    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :first_name, :last_name, :gender, :email, :city, :target_min_age,
  :target_max_age, :target_gender, :birthday, :admin


end
