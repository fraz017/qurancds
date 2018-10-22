ActiveAdmin.register Speaker do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :image
config.filters = false
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

    index do
        column :name
        column :image do |speaker|
            if speaker.image.attached?
                image_tag url_for(speaker.image), height: "50"
            else
                "N/A"
            end
        end
        actions
    end

    form do |f|
        f.inputs 'Speaker' do
            f.input :name
            # f.input :image, as: :file
        end
        f.actions
    end

    show do
        attributes_table do
            row :name
            row :image do |speaker|
                if speaker.image.attached?
                    image_tag url_for(speaker.image), height: "200"
                else
                    "No Image Avaialable"
                end
            end
        end
    end
end
