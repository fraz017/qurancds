class Category < ApplicationRecord
    validates_presence_of :name
    has_and_belongs_to_many :cds

    def as_json(options = {})
        h = super(options.merge({ except: [:created_at, :updated_at]}))
        if options[:show].present?
            h[:cds] = cds.as_json(index: true)
        end
        h
    end
end
