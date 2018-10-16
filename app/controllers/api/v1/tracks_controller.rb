class Api::V1::TracksController < ApiController
  def show
    @track = Track.find params[:id]
    json_response(@track, "success", {}, 200)
  end
end
