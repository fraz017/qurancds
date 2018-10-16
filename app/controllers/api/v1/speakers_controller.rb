class Api::V1::SpeakersController < ApiController
  def index
    @speakers = Speaker.all
    json_response(@speakers, "success", {}, 200)
  end

  def show
    @speaker = Speaker.find params[:id]
    json_response(@speaker.as_json(show: true), "success", {}, 200)
  end
end
