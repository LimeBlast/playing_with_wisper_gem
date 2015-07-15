class PresentationsController < ApplicationController
  def show
    @presentation = Presentation.find(params.fetch(:id))
  end

  def new
    @presentation = CreatePresentationForm.new
  end

  def create
    form = CreatePresentationForm.new(params.fetch(:create_presentation_form))

    @presentation = CreatePresentation.new(form)

    @presentation.on(:create_presentation_successful) { create_presentation_successful }
    @presentation.on(:create_presentation_failed) { |presentation| create_presentation_failed presentation }

    @presentation.call
  end

  def create_presentation_successful
    redirect_to presentation_path(@presentation)
  end

  def create_presentation_failed(form)
    @presentation = form
    render action: :new
  end
end
