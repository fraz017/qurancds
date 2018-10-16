class Api::V1::CategoriesController < ApiController
  def index
    @categories = Category.all
    json_response(@categories, "success", {}, 200)
  end

  def show
    @category = Category.find params[:id]
    json_response(@category.as_json(show: true), "success", {}, 200)
  end
end
