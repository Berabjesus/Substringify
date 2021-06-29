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
    string = string.gsub(/[^0-9a-z ]/i, '').delete(" \t\r\n")
    if string.nil? || string == ""
      return nil
    end
    str_to_char = string.chars
    map = {}
    first = -1
    last = 0
    res = 0
    staring_index = 0
    ending_index = 0
    str_to_char.each_with_index do |char, i|
      if !map[char]
        map[char] = i
        last = i
      else
        if res < last - first
          res = last - first
          staring_index = first + 1
          ending_index = last
        end
        map = {}
        map[char] = i
        first = last
      end
    end
    substring = nil
    res = last - first if res == 0

    if map.length > res
      res = map.length
      staring_index = map[map.keys.first]
      ending_index = map[map.keys.last]
      substring = string[staring_index..ending_index]
    elsif staring_index == 0 && ending_index == 0
      substring = string[first + 1..last]
    else
      substring = string[staring_index..ending_index]
    end
    substring
  end

  def input_params
    params.permit(:query)
  end
end
