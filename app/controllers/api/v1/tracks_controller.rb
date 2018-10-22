class Api::V1::TracksController < ApiController
  def show
    @track = Track.find params[:id]
    json_response(@track, "success", {}, 200)
  end

  def process_track
    blob = ActiveStorage::Blob.create_after_upload!(
      io: params[:cd][:tracks][0].tempfile,
      filename: params[:cd][:tracks][0].original_filename,
      content_type: params[:cd][:tracks][0].content_type
    )

    render json: { filename: "#{params[:cd][:tracks][0].original_filename}", signature: blob.signed_id }
  end
end
