class PresentationsController < ApplicationController
  def show
    result = FindPresentation.call({ id: params.fetch(:id) })

    if result.success?
      @presentation = result.presentation
    else
      render_not_found
    end
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
    result = EditPresentation.call({ id: params.fetch(:id) })

    if result.success?
      @form         = result.form
      @presentation = result.presentation
    else
      render_not_found
    end
  end

  def update
    result = UpdatePresentation.call(
      { id:     params.fetch(:id),
        params: params.fetch(:presentation_form) }
    )

    if result.success?
      redirect_to presentation_path(result.presentation)
    else
      @form         = result.form
      @presentation = result.presentation
      render action: :edit
    end
  end

  # def update
  #   presentation = Presentation.find(params.fetch(:id))
  #
  #   form = PresentationForm.new(params.fetch(:presentation_form))
  #
  #   command = OldUpdatePresentation.new(form, presentation)
  #   command.subscribe(PresentationNotifier.new)
  #   command.on(:successful) { |presentation| redirect_to presentation_path(presentation) }
  #   command.on(:failed) { |form| @form = form; @presentation = presentation; render action: :edit }
  #   command.call
  # end
end
