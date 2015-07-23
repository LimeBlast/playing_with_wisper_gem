class PresentationsController < ApplicationController
  def show
    @presentation = Presentation.find(params.fetch(:id))
  end

  def new
    @form = PresentationForm.new
  end

  def create
    form = PresentationForm.new(params.fetch(:presentation_form))

    command = CreatePresentation.new(form)

    command.subscribe(PresentationNotifier.new)

    command.on(:create_presentation_successful) { |result| redirect_to presentation_path(result) }
    command.on(:create_presentation_failed)     { |result| @form = result; render action: :new }

    command.call
  end
end
