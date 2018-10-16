class Cd < ApplicationRecord
    validates_presence_of :name
    has_and_belongs_to_many :languages
    has_and_belongs_to_many :speakers
    has_and_belongs_to_many :categories

    has_many :tracks

    has_one_attached :cover

    accepts_nested_attributes_for :tracks, allow_destroy: true
end
