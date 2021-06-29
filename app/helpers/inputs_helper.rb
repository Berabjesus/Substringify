module InputsHelper
  def result
    if @query && @sub_string
      out = render '/inputs/result'
      out.html_safe
    end
  end
end
