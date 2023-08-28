require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'johndoe@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a first name' do
      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user.password_confirmation = 'mismatched_password'
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      existing_user = User.create(
        first_name: 'John1',
        last_name: 'Doe1',
        email: 'johndoe@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.email = existing_user.email 
      expect(user).not_to be_valid
    end

    it 'requires a unique email (case-insensitive)' do
      existing_user = User.create(
        first_name: 'John2',
        last_name: 'Doe2',
        email: 'johndoe@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.email = existing_user.email.upcase
      expect(user).not_to be_valid
    end

    it 'is not valid if password length is less than 8 characters' do
      user.password = 'short'
      expect(user).not_to be_valid
    end

    it 'is valid with a password of at least 8 characters' do
      user.password = 'securepwd'
      user.password_confirmation = 'securepwd'
      expect(user).to be_valid
    end
  end
end
