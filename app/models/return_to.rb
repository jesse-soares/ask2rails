class ReturnTo
  def initialize(default_path, chosen_path)
    @default_path = default_path
    @chosen_path = chosen_path
  end

  def path
    uri = URI.parse(return_to)
    path = uri.path
    path << "?#{uri.query}" if uri.query
    path << "##{uri.fragment}" if uri.fragment
    path
  rescue URI::InvalidURIError
    @default_path
  end

  private
  def return_to
    @chosen_path || @default_path
  end
end