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
    command.on(:successful) { |result| redirect_to presentation_path(result) }
    command.on(:failed) { |result| @form = result; render action: :new }
    command.call
  end

  def edit
    @presentation = Presentation.find(params.fetch(:id))

    @form = PresentationForm.build(@presentation)
  end

  def update
    presentation = Presentation.find(params.fetch(:id))

    form = PresentationForm.new(params.fetch(:presentation_form))

    command = UpdatePresentation.new(form, presentation)
    command.subscribe(PresentationNotifier.new)
    command.on(:successful) { |result| redirect_to presentation_path(result) }
    command.on(:failed)     { |result| @form = result; @presentation = presentation; render action: :edit }
    command.call
  end
end
