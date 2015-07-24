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
    command.on(:successful) { |presentation| redirect_to presentation_path(presentation) }
    command.on(:failed) { |form| @form = form; render action: :new }
    command.call
  end

  def edit
    command = FindPresentation.new(params.fetch(:id))
    command.on(:successful) { |presentation| @form = PresentationForm.build(presentation); @presentation = presentation }
    command.on(:failed) { render_not_found }
    command.call
  end

  def update
    presentation = Presentation.find(params.fetch(:id))

    form = PresentationForm.new(params.fetch(:presentation_form))

    command = UpdatePresentation.new(form, presentation)
    command.subscribe(PresentationNotifier.new)
    command.on(:successful) { |presentation| redirect_to presentation_path(presentation) }
    command.on(:failed) { |form| @form = form; @presentation = presentation; render action: :edit }
    command.call
  end
end
