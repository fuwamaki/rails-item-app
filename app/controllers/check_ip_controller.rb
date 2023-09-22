class CheckIpController < ApplicationController
  def index
    render json: { ip: request.remote_ip }, status: :ok
  end
end
