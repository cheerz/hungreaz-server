class ApplicationError < StandardError

  def initialize msg = 'Unknown error'
    super msg
  end

  class MissingParameter < StandardError ; end

end
