require 'rails_helper'

RSpec.feature 'Planning a presentation', type: :feature do
  scenario 'happy path' do
    visit '/presentations/new'

    fill_in 'create_presentation_form[title]', with: 'title title title'
    fill_in 'create_presentation_form[who]', with: 'who who who'
    fill_in 'create_presentation_form[action]', with: 'action action action'
    fill_in 'create_presentation_form[baggage]', with: 'baggage baggage baggage'
    fill_in 'create_presentation_form[important]', with: 'important important important'
    fill_in 'create_presentation_form[plan]', with: 'plan plan plan'
    click_button 'Create'

    expect(page).to have_content('title title title')
    expect(page).to have_content('who who who')
    expect(page).to have_content('action action action')
    expect(page).to have_content('baggage baggage baggage')
    expect(page).to have_content('important important important')
    expect(page).to have_content('plan plan plan')
  end

  scenario 'empty form' do
    visit '/presentations/new'

    click_button 'Create'

    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Who can\'t be blank')
    expect(page).to have_content('Action can\'t be blank')
    expect(page).to have_content('Baggage can\'t be blank')
    expect(page).to have_content('Important can\'t be blank')
    expect(page).to have_content('Plan can\'t be blank')
  end
end
