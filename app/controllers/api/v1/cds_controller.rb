class Api::V1::CdsController < ApiController
  def index
    @cds = Cd.all
    json_response(@cds.as_json(index: true), "success", {}, 200)
  end

  def show
    @cd = Cd.find params[:id]
    json_response(@cd.tracks, "success", {}, 200)
  end

  def feedback
    @cd = Cd.find params[:id]
    @feedback = Feedback.new(email: params[:email], comment: params[:comment], points: params[:points])
    @feedback.cd = @cd
    if @feedback.valid? && @feedback.save
      json_response(@feedback, "success", {}, 200)
    else
      json_response({}, "error", @feedback.errors.full_messages, 200)
    end
  end

  def ratings
    @cd = Cd.find params[:id]
    json_response(@cd.feedbacks, "success", {}, 200)
  end
end
