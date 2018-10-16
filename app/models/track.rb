class Track < ApplicationRecord
  validates_presence_of :name
  belongs_to :cd
  has_one_attached :media

  validates :media, attached: true,  
    content_type: { in: ['audio/mp3', 'audio/mpeg', 'audio/mpeg3', 'audio/x-mpeg-3'], message: 'only mp3 are allowed' }
  # validate :file_presence

  def as_json(options = {})
    h = super(options.merge({ except: [:created_at, :updated_at, :cd_id]}))
    h[:track] = Rails.application.routes.url_for(controller: 'active_storage/blobs', action: :show, signed_id: media.signed_id, filename: media.filename)
    h
  end
    
  private

  def file_presence
      if media.attached? && !media.content_type.in?(%w(audio/mp3 audio/mpeg))
        errors.add(:media, 'Must be an mp3 file')
        return true
      else
        errors.add(:media, 'Must be attached')
        return false
      end
  end
end
