class InputsController < ApplicationController
  before_action :access_control, only: %i[new create destroy]
  
  def new
    @query = input_params[:query]
    @sub_string = nil
    unless @query.nil?
     @sub_string = get_longest_substring @query
    end
  end

  def create
    return if input_params[:query].nil? || input_params[:query].length == 0

    @input = current_user.inputs.build(input_params)
    @input.result = get_longest_substring input_params[:query]
    if @input.save
      redirect_to "/#{params[:query]}"
    else
      flash[:alert] = "Unable to store to database"
      redirect_to new_input_path
    end
  end

  private
  
  def get_longest_substring string
    string = string.gsub(/[^0-9a-z]/i, '')
    if string.nil? || string == ""
      return nil
    end
    str_to_char = string.chars
    map = {}
    first = 0
    last = 0
    diff = 0
    staring_index = 0
    ending_index = 0

    str_to_char.each_with_index do |char, i|
      if !map[char] || map[char] < first
        map[char] = i
        last = i
      else
        if diff < last - first
          diff = last - first
          staring_index = first
          ending_index = last
        end
        if map[char] >= first
          first = map[char] + 1
        else
          first = i
        end
        map[char] = i
        last = first = i
      end
      if diff < last - first
        staring_index = first
        ending_index = last
      end
    end

    return string [staring_index..ending_index]
  end

  def input_params
    params.permit(:query)
  end
end
