class PersistPresentation
  include Interactor

  delegate :presentation, :form, to: :context

  def call
    presentation.update_attributes(form.attributes)
  end
end
