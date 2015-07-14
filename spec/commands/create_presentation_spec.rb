require 'spec_helper'
require 'wisper'

require_relative '../../app/commands/create_presentation'

RSpec.describe CreatePresentation do
  let(:form) { double('Form', valid?: valid?) }

  context 'valid form' do
    let(:valid?) { true }

    it 'broadcasts :create_presentation_successful' do
      expect(described_class.new(form).execute).to broadcast(:create_presentation_successful)
    end
  end

  context 'not valid form' do
    let(:valid?) { false }

    it 'broadcasts :create_presentation_failed' do
      command = described_class.new(form)
      expect(command.execute).to broadcast(:create_presentation_failed, form)
    end
  end
end
