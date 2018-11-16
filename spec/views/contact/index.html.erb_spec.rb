# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contact/index', type: :view do
  it 'renders CONTACT header' do
    message = FactoryBot.build(:message)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form h2', text: 'CONTACT')
  end

  it 'renders contact form' do
    message = FactoryBot.build(:message, name: nil, email: nil, body: nil)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form')
  end

  it 'renders name' do
    message = FactoryBot.build(:message)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form #name')
  end

  it 'renders email' do
    message = FactoryBot.build(:message)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form #email')
  end

  it 'renders body' do
    message = FactoryBot.build(:message)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form #body')
  end

  it 'renders submit button' do
    message = FactoryBot.build(:message)
    assign(:message, message)
    render
    expect(rendered).to have_selector('.contact-form #submit')
  end

  it 'renders errors correctly' do
    message = FactoryBot.build(:message, name: nil)
    message.errors.add(:name, "can't be blank")
    assign(:message, message)
    render
    expect(rendered).to have_selector('.error-explanation', text: "Name can't be blank")
  end
end
