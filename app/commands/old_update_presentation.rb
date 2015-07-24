class OldUpdatePresentation
  include Wisper::Publisher

  attr_reader :form, :presentation

  def initialize(form, presentation)
    @form         = form
    @presentation = presentation
  end

  def call
    if form.valid?
      presentation.update_attributes(form.attributes)
      broadcast(:successful, presentation)
    else
      broadcast(:failed, form)
    end
  end
end
