class PresentationMailer < ApplicationMailer
  def presentation_notifier(presentation)
    @presentation = presentation
    mail(
      to:      'dutch@limeblast.co.uk',
      subject: 'A presentation has been posted'
    )
  end
end
