class UpdatePresentation
  include Interactor::Organizer

  organize FindPresentation, ValidatePresentationForm, PersistPresentation
end
