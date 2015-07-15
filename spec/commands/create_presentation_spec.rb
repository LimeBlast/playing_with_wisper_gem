require 'spec_helper'
require 'wisper'

require_relative '../../app/commands/create_presentation'

RSpec.describe CreatePresentation do
  let(:form) { double('Form', valid?: valid?, attributes: attributes) }
  let(:attributes) { {} }

  context 'valid form' do
    let(:valid?) { true }
    let(:presentation_class) { class_double('Presentation').as_stubbed_const }
    let(:presentation_object) { double }

    before :each do
      expect(presentation_class).to receive(:create).with(attributes).and_return(presentation_object)
    end

    it 'broadcasts :create_presentation_successful' do
      expect { described_class.new(form).call }.to broadcast(:create_presentation_successful)
    end
  end

  context 'not valid form' do
    let(:valid?) { false }

    it 'broadcasts :create_presentation_failed and return the form' do
      expect { described_class.new(form).call }.to broadcast(:create_presentation_failed, form)
    end
  end
end
