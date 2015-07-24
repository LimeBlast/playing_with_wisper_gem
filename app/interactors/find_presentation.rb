class FindPresentation
  include Interactor

  delegate :id, to: :context

  def call
    context.presentation = Presentation.find(id)
  rescue ActiveRecord::RecordNotFound
    context.fail!
  end
end
