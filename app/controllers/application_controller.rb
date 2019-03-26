class ApplicationController < ActionController::API

  def hello
    render json: { text: 'Hello World' }
  end

end
