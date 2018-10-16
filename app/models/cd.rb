class Cd < ApplicationRecord
    validates_presence_of :name
    has_and_belongs_to_many :languages
    has_and_belongs_to_many :speakers
    has_and_belongs_to_many :categories

    has_many :tracks

    has_one_attached :cover

    accepts_nested_attributes_for :tracks, allow_destroy: true

    def as_json(options = {})
        h = super(options.merge({ except: [:created_at, :updated_at]}))
        h[:cover] = Rails.application.routes.url_for(controller: 'active_storage/blobs', action: :show, signed_id: cover.signed_id, filename: cover.filename)
        h[:categories] = categories.map{|c| c.name}
        h[:speakers] = speakers.map{|s| s.name}
        h[:languages] = languages.map{|l| l.name}
        if options[:index].nil? 
            h[:tracks] = tracks
        end
        h
    end
end
