require 'rails_helper'

# TODO: reimplement tests for form
RSpec.describe 'about/_contact_form', type: :view do
  it 'renders header'
  it 'renders placeholder text for name'
  it 'renders placeholder text for email'
  it 'renders placeholder text for body'
  it 'renders name input'
  it 'renders email input'
  it 'renders body input'
  it 'renders submit button'

  context 'when invalid' do
    it 'renders error styling for name'
    it 'renders error styling for email'
    it 'renders error styling for body'
  end


  # it 'renders CONTACT header' do
  #   message = FactoryBot.build(:message)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form h2', text: 'CONTACT')
  # end

  # it 'renders contact form' do
  #   message = FactoryBot.build(:message, name: nil, email: nil, body: nil)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form')
  # end

  # it 'renders name' do
  #   message = FactoryBot.build(:message)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form #name')
  # end

  # it 'renders email' do
  #   message = FactoryBot.build(:message)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form #email')
  # end

  # it 'renders body' do
  #   message = FactoryBot.build(:message)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form #body')
  # end

  # it 'renders submit button' do
  #   message = FactoryBot.build(:message)
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.contact-form #submit')
  # end

  # it 'renders errors correctly' do
  #   message = FactoryBot.build(:message, name: nil)
  #   message.errors.add(:name, "can't be blank")
  #   assign(:message, message)
  #   render
  #   expect(rendered).to have_selector('.error-explanation', text: "Name can't be blank")
  # end

end
