class ValidatePresentationForm
  include Interactor

  delegate :params, to: :context

  def call
    context.form = PresentationForm.new(context.params)
    unless context.form.valid?
      context.fail!
    end
  end
end
