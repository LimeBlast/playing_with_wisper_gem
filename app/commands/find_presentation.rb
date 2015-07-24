class FindPresentation
  include Wisper::Publisher

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def call
    presentation = Presentation.find(id)
    broadcast(:successful, presentation)
  rescue ActiveRecord::RecordNotFound
    broadcast(:failed)
  end
end
