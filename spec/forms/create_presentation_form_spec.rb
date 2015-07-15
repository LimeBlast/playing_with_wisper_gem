require 'spec_helper'
require 'active_model'
require 'virtus'
require 'rspec-virtus'
require 'shoulda-matchers'

require_relative '../../app/forms/create_presentation_form'

RSpec.describe CreatePresentationForm do

  describe 'attributes' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:who) }
    it { should validate_presence_of(:action) }
    it { should validate_presence_of(:baggage) }
    it { should validate_presence_of(:important) }
    it { should validate_presence_of(:plan) }

    it 'has title as a String' do
      expect(described_class).to have_attribute(:title).of_type(String)
    end

    it 'has who as a String' do
      expect(described_class).to have_attribute(:who).of_type(String)
    end

    it 'has action as a String' do
      expect(described_class).to have_attribute(:action).of_type(String)
    end

    it 'has baggage as a String' do
      expect(described_class).to have_attribute(:baggage).of_type(String)
    end

    it 'has important as a String' do
      expect(described_class).to have_attribute(:important).of_type(String)
    end

    it 'has plan as a String' do
      expect(described_class).to have_attribute(:plan).of_type(String)
    end
  end
end
