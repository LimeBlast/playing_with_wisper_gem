class CreatePresentationForm
  include ActiveModel
  include Virtus.model

  attribute :title, String
  attribute :who, String
  attribute :action, String
  attribute :baggage, String
  attribute :important, String
  attribute :plan, String
end
