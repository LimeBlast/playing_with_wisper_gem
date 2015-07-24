class PopulatePresentationForm
  include Interactor

  delegate :presentation, to: :context

  def call
    context.form = PresentationForm.build(presentation)
  end
end
