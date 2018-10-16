module Response
  def json_response(object, success, errors, status = :ok)
    render json: {status: success, data: object, errors: errors}, status: status
  end
end