class SayController < ApplicationController
  def hello
    @current_time = Time.now
  end

  def goodbye
  end
end
