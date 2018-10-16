class Api::V1::LanguagesController < ApiController
  def index
    @languages = Language.all
    json_response(@languages, "success", {}, 200)
  end

  def show
    @language = Language.find params[:id]
    json_response(@language.as_json(show: true), "success", {}, 200)
  end
end
