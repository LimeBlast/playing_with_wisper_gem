class CreatePresentation
  include Wisper::Publisher

  attr_reader :form

  def initialize(form)
    @form = form
  end

  def execute
    if form.valid?
      broadcast(:create_presentation_successful)
    else
      broadcast(:create_presentation_failed, form)
    end
  end
end
