class GreetingController < ApplicationController
  def index
    render plain: "Hello World"
  end
end
