# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  it 'can exist' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    get "/sauces/#{sauce.id}"
    expect(response.body).to have_selector('.comment', count: 1)
  end

  it 'can be duplicates' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    FactoryBot.create(:comment, sauce: sauce)
    get "/sauces/#{sauce.id}"
    expect(response).to have_http_status(:ok)
  end

  context 'when valid' do
    it 'creates successfully' do
      sauce = FactoryBot.create(:sauce)
      post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'Some Person', body: 'Some Comment' } }
      expect(response).to redirect_to("/sauces/#{sauce.id}")
    end

    it 'it displays on page after posting' do
      sauce = FactoryBot.create(:sauce)
      post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'Some Person', body: 'Some Comment' } }
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.comment')
    end
  end

  it 'are invalid without name' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: nil, body: 'Some Comment' } }
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  it 'are invalid without body' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'A great tasting sauce!', body: nil } }
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  it 'body can be edited' do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.create(:comment, sauce: sauce)
    put "/sauces/#{sauce.id}/comments/#{comment.id}", params: { comment: { body: 'A Different Body' } }
    expect(response.body).to have_selector('.comment-body', text: 'A Different Body')
  end

  it 'name can not be edited' do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.create(:comment, sauce: sauce)
    put "/sauces/#{sauce.id}/comments/#{comment.id}", params: { comment: { name: 'Different Name' } }
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  it 'can be deleted' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    delete "/sauces/#{sauce.id}/comments/#{comment.id}"
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  it 'deleted comment is no longer displayed' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    delete "/sauces/#{sauce.id}/comments/#{comment.id}"
    expect(response).to have_no_selector('.comment')
  end
end
