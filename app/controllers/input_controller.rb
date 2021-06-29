class InputController < ApplicationController
  before_action :access_control, only: %i[index new create destroy]

  def index
   
  end

  def new
    # session.clear
  end

  def create
  end

  def destroy
  end
end
