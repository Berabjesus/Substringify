module InputsHelper
  def result
    if @query
      capture { link_to 'Home', inputs_path, class: 'text-uppercase border-dark pr-3  mb-3 mb-md-0' }
    end
  end
end
