class Metadata
  # Cop dissable because in classes,
  # we only can init empty array with .new
  # rubocop:disable Style/EmptyLiteral
  def initialize
    @title = Array.new
    @location = Array.new
    @salary = Array.new
    @content = Array.new
  end
  # rubocop:enable Style/EmptyLiteral
end
