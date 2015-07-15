class CreatePresentation
  include Wisper::Publisher

  attr_reader :form

  def initialize(form)
    @form = form
  end

  def call
    if form.valid?
      presentation = Presentation.create(form.attributes)
      broadcast(:create_presentation_successful, presentation)
    else
      broadcast(:create_presentation_failed, form)
    end
  end
end
