class Feedback < ApplicationRecord
  belongs_to :cd

  validates_presence_of :email, :points

  def as_json(options = {})
      h = super(options.merge({ except: [:created_at, :updated_at, :cd_id]}))
      h
  end
end
