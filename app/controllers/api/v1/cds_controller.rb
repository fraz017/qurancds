class Api::V1::CdsController < ApiController
  def index
    @cds = Cd.all
    json_response(@cds.as_json(index: true), "success", {}, 200)
  end

  def show
    @cd = Cd.find params[:id]
    json_response(@cd.tracks, "success", {}, 200)
  end
end
