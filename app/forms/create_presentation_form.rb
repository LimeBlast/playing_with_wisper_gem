class CreatePresentationForm
  include ActiveModel::Model
  include Virtus.model

  attribute :title, String
  attribute :who, String
  attribute :action, String
  attribute :baggage, String
  attribute :important, String
  attribute :plan, String

  validates :title, :who, :action, :baggage, :important, :plan, presence: true
end
