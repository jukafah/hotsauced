require 'rails_helper'

RSpec.describe "Comments", type: :request do

  it 'can exist' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    get "/sauces/#{sauce.id}"
    expect(response).to have_selector('.comment', count: 1)
  end

  it 'commenter name is correct' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    get "/sauces/#{sauce.id}"
    expect(response).to have_selector('.name', count: 1, text: comment.commenter)
  end

  it 'commenter body is correct' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    get "/sauces/#{sauce.id}"
    expect(response).to have_selector('.body', count: 1, text: comment.body)
  end

  it 'can be duplicates' do
    comments = FactoryBot.build_list(:comment, 20)
    sauce = FactoryBot.create(:sauce, comments: [comments])
    get "/sauces/#{sauce.id}"
    expect(response).to have_selector('.comment', count: 20)
  end

  it 'can not exist' 

  it 'can be created' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'Some Person', body: 'Some Comment' } }
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  it 'it displays on page after posting' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'Some Person', body: 'Some Comment' } }
    expect(response.body).to have_selector('.comment', count: 1)
  end

  it 'are invalid without name' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: nil, body: 'Some Comment' } }
    expect(response).to have_http_status(:bad_request)
  end

  it 'are invalid without body' do
    sauce = FactoryBot.build(:sauce)
    post "/sauces/#{sauce.id}/comments", params: { comment: { commenter: 'Some Person', body: nil } }
    expect(response).to have_http_status(:bad_request)
  end

  it 'body can be edited' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    put "/sauces/#{sauce.id}/comments/#{comment.id}", params: { comment: { body: 'A Different Body' } }
    expect(response.body).to have_selector('.comment-body', text: 'A Different Body')
  end

  it 'name can not be edited' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    put "/sauces/#{sauce.id}/comments/#{comment.id}", params: { comment: { name: 'Different Name' } }
    expect(response).to have_http_status(:bad_request)
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
