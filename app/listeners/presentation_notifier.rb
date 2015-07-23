class PresentationNotifier
  def successful(presentation)
    PresentationMailer.presentation_notifier(presentation).deliver_later
  end
end
