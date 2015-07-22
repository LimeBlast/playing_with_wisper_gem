class PresentationNotifier
  def create_presentation_successful(presentation)
    PresentationMailer.presentation_notifier(presentation).deliver_later
  end
end
