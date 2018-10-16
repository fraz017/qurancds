class Speaker < ApplicationRecord
    validates_presence_of :name
    has_one_attached :image
    has_and_belongs_to_many :cds
end
