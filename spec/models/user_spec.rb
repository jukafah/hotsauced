# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'new users can be created when' do
    it 'all required parameters exist' do
      user = FactoryBot.build(:user)
      result = user.save
      expect(result).to be(true)
    end
  end

  context 'new users are not created when' do
    it 'a duplicate username already exists' do
      FactoryBot.create(:user)
      duplicate_user = FactoryBot.build(:user, email: 'different@email.com')
      result = duplicate_user.save
      expect(result).to be(false)
    end

    it 'a duplicate email already exists' do
      FactoryBot.create(:user)
      duplicate_user = FactoryBot.build(:user, username: 'differentUsername')
      result = duplicate_user.save
      expect(result).to be(false)
    end

    it 'username is greater than 32 characters' do
      username = 'a' * 33
      user = FactoryBot.build(:user, username: username)
      result = user.save
      expect(result).to be(false)
    end

    it 'email is greater than 128 characters' do
      email = 'a' * 129
      user = FactoryBot.build(:user, email: email)
      result = user.save
      expect(result).to be(false)
    end
  end

  context 'email' do
    it 'is saved to lowercase' do
      email = 'SOMEONE@SOMEWHERE.COM'
      user = FactoryBot.create(:user, email: email)
      expect(user.email). to eq(email.downcase)
    end

    context 'is invalid when' do
      it 'missing @' do
        email = 'someonesomewhere.com'
        user = FactoryBot.build(:user, email: email)
        result = user.save
        expect(result).to be(false)
      end

      it 'missing .com' do
        email = 'someone@somewhere'
        user = FactoryBot.build(:user, email: email)
        result = user.save
        expect(result).to be(false)
      end
    end
  end

  context 'authentication' do
    context 'with valid credentials' do
      it 'valid user is returned' do
        user = FactoryBot.create(:user)
        authenticated_user = User.authenticate(user.email, user.password)
        expect(authenticated_user).to eq(user)
      end
    end

    context 'with invalid credentials' do
      it 'sign in error is returned' do
        user = FactoryBot.create(:user)
        invalid_user = User.authenticate(user.email, 'blah')
        expect(invalid_user.errors[:invalid][0]).to eq('Sign in failed. Your email and password do not match')
      end
    end

    context 'when user is remembered' do
      it 'token is saved' do
        user = FactoryBot.create(:user)
        user.remember
        expect(user.remember_digest).not_to be(nil)
      end

      it 'user can be forgotten' do
        user = FactoryBot.create(:user)
        user.remember
        user.forget
        expect(user.remember_digest).to be(nil)
      end
    end
  end
end
