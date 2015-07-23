class CreatePresentation
  include Wisper::Publisher

  attr_reader :form

  def initialize(form)
    @form = form
  end

  def call
    if form.valid?
      presentation = Presentation.create(form.attributes)
      broadcast(:successful, presentation)
    else
      broadcast(:failed, form)
    end
  end
end
