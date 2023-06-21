ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :number, :email, :notes, :image
  #
  # or
  #
  permit_params do
    permitted = %i[name number email notes image]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :name
      f.input :number
      f.input :email
      f.input :notes
      f.input :image, as: :file
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :number
      row :email
      row :notes
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end
