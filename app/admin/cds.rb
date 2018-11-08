ActiveAdmin.register Cd do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :cover, :order_url, tracks: [],
    category_ids: [],
    language_ids: [],
    speaker_ids: []
    # tracks_attributes: [ :id, :name, :media, :_destroy, :_create, :_update ]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

    form do |f|
        f.inputs 'Add CD' do
            f.input :name
            f.input :cover, as: :file
            f.input :order_url
            f.input :categories, :as => :select, :input_html => {:multiple => true, class: "categories_select", style: "width: 80%;"}
            f.input :speakers, :as => :select, :input_html => {:multiple => true, class: "speakers_select", style: "width: 80%;"}
            f.input :languages, :as => :select, :input_html => {:multiple => true, class: "languages_select", style: "width: 80%;"}
            f.input :tracks1, :as => :file, :input_html => {:multiple => true, class: "filepond", id: "file-music", style: "width: 80%;", "data-direct-upload-url": rails_direct_uploads_url}, direct_upload: true
            render 'new_form', {f: f}
        end
        # f.inputs "Add Tracks" do
        #     f.has_many :tracks, allow_destroy: true, heading: false do |b|
        #         b.input :name
        #         b.input :media, label: "Tracks", as: :file, input_html: { "data-direct-upload-url": rails_direct_uploads_url }
        #     end
        # end
        f.actions
    end

    show do
        attributes_table do
            row :name
            row :cover do |app|
                if app.cover.attached?
                    image_tag url_for(app.cover), height: "200"
                else
                    "No Cover Avaialable"
                end
            end
            row :order_url
            row "Categories" do |app|
                ul do 
                    app.categories.each do |c|
                        li c.name     
                    end
                end
            end
            row "Languages" do |app|
                ul do 
                    app.languages.each do |l|
                        li l.name     
                    end
                end
            end
            row "Speakers" do |app|
                ul do 
                    app.speakers.each do |s|
                        li s.name     
                    end
                end
            end
        end
        panel "Available Tracks" do
            table_for cd.tracks do
                column "Track" do |track|
                    link_to "Download Track", rails_blob_path(track, disposition: "attachment")
                end
            end
        end
    end
end
