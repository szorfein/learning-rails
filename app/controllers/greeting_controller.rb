class GreetingController < ApplicationController
  def index
    @message = "Hello World"
    @current_time = Time.now
  end

  def show
  end

  def say_goodmorning
  end

  def say_goodafternoon
  end
end
