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
    max_len = 0
    staring_index = 0
    ending_index = 0

    # b = 0  
    # k = 1    last = 1
    # b = 2    max = 2      si = 0    ei = 1    fr = 2  las = 2
    # b = 3    max = 2      fr = 3   ls = 3
    # e = 4    las = 4
    # r = 5 == las
    # f = 6 == las
    # s = 7 == las
    # d = 8 == las
    # f
    # 

    str_to_char.each_with_index do |char, i|
      if !map[char]
        map[char] = i
        last = i
      else
        if max_len < last - first
          max_len = last - first
          staring_index = first
          ending_index = last
        end
        map = {}
        map[char] = i
        first = last = i
      end
    end
    substring = nil
    max_len = last - first if max_len == 0

    if map.length > max_len
      staring_index = map[map.keys.first]
      ending_index = map[map.keys.last]
      substring = string[staring_index..ending_index]
    else
      substring = string[staring_index..ending_index]
    end
    substring
  end

  def input_params
    params.permit(:query)
  end
end
