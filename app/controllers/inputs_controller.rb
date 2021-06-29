class InputsController < ApplicationController
  before_action :access_control, only: %i[index new create destroy]

  def index
   
  end

  def new
    @query = input_params[:query]
    unless @query.nil?
      
    end
    p @query
    # @input 
    # session.clear
    # redirect_to "/#{params[:name]}"
  end

  def create
    p params[:query]
    redirect_to "/#{params[:query]}"
  end

  def destroy
  end

  private 

  def input_params
    params.permit(:query)
  end
end
