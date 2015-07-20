require 'rails_helper'
require 'wisper/rspec/stub_wisper_publisher'

RSpec.describe PresentationsController, type: :controller do
  describe 'GET #show' do
    let(:presentation_class) { class_double('Presentation').as_stubbed_const }
    let(:presentation_object) { double }
    let(:presentation_id) { '1' }

    before :each do
      expect(presentation_class).to receive(:find).with(presentation_id).and_return(presentation_object)
      get :show, id: presentation_id
    end

    it 'renders :show template' do
      expect(controller).to render_template(:show)
    end
  end

  describe 'GET #new' do
    let(:form_class) { class_double('CreatePresentationForm').as_stubbed_const }
    let(:form_object) { double }

    before :each do
      expect(form_class).to receive(:new).and_return(form_object)
      get :new
    end

    it 'assigns create object to @form' do
      expect(assigns(:form)).to eq form_object
    end

    it 'renders :new template' do
      expect(controller).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:form_class) { class_double('CreatePresentationForm').as_stubbed_const }
    let(:form_object) { double }

    let(:presentation_notifier) { class_double('PresentationNotifier').as_stubbed_const }

    before :each do
      expect(form_class).to receive(:new).and_return(form_object)
      expect(presentation_notifier).to receive(:new)
    end

    context 'create_presentation_successful' do
      let(:result) { double('Presentation', id: 1) }

      before do
        stub_wisper_publisher('CreatePresentation', :call, :create_presentation_successful, result)
        post :create, create_presentation_form: {}
      end

      it 'redirects' do
        expect(response).to redirect_to(presentation_path(result))
      end
    end

    context 'create_presentation_failed' do
      let(:result) { double }

      before do
        stub_wisper_publisher('CreatePresentation', :call, :create_presentation_failed, result)
        post :create, create_presentation_form: {}
      end

      it 'assigns result to @form' do
        expect(assigns(:form)).to eq result
      end

      it 'renders :new template' do
        expect(controller).to render_template(:new)
      end
    end
  end
end
