# TODO: needs to be refactored with new review implementation

# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'reviews/_review', type: :view do
#   it 'renders' do
#     sauce = FactoryBot.create(:sauce)
#     FactoryBot.create(:review, sauce: sauce)
#     assign(:sauce, sauce)
#     render
#     expect(rendered).to have_selector('#review', count: 1)
#   end

#   it 'renders partial per review' do
#     sauce = FactoryBot.create(:sauce)
#     FactoryBot.create(:review, sauce: sauce)
#     FactoryBot.create(:review, sauce: sauce)
#     assign(:sauce, sauce)
#     render
#     expect(rendered).to have_selector('#review', count: 2)
#   end

#   it 'renders user layout' do
#     sauce = FactoryBot.create(:sauce)
#     review = FactoryBot.create(:review, sauce: sauce)
#     assign(:sauce, sauce)
#     render
#     expect(rendered).to have_selector('#user-layout', text: review.user)
#   end

#   it 'renders review body layout' do
#     sauce = FactoryBot.create(:sauce)
#     review = FactoryBot.create(:review, sauce: sauce)
#     assign(:sauce, sauce)
#     render
#     expect(rendered).to have_selector('#body-layout', text: review.body)
#   end
# end
