class UpdatePresentation
  include Wisper::Publisher

  attr_reader :form, :id

  def initialize(form, id)
    @form = form
    @id   = id
  end

  def call
    command = FindPresentation.new(id)
    command.on(:successful) do |presentation|
      if form.valid?
        presentation.update_attributes(form.attributes)
        broadcast(:successful, presentation)
      else
        broadcast(:failed, form, presentation)
      end
    end
    command.on(:failure) do
      broadcast(:failed)
    end
    command.call
  end
end
