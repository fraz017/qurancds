class Api::V1::TracksController < ApiController
  def show
    @track = ActiveStorage::Blob.find(params[:id]) 
    track = Hash.new
    track[:id] = @track.id
    track[:name] = @track.filename.to_s
    track[:track] = Rails.application.routes.url_for(controller: 'active_storage/blobs', action: :show, signed_id: @track.signed_id, filename: @track.filename)
    json_response(track, "success", {}, 200)
  end

  def destroy
    @track = ActiveStorage::Attachment.where(id: params[:id])
    if @track.length == 0
      @track = ActiveStorage::Blob.where(id: params[:id])
      signed_id = @track.first.signed_id
    end
    @track.first.purge
    json_response({id: signed_id}, "success", {}, 200)
  end
end
