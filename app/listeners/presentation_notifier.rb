class PresentationNotifier
  def create_presentation_successful(presentation)

      puts '#############################################'
      puts '#############################################'
      puts presentation
      puts '#############################################'
      puts '#############################################'

      PresentationMailer.presentation_notifier(presentation).deliver_now
  end
end
