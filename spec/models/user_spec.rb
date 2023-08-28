require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(
      name: 'John Doe',
      username: 'johndoe@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
      user.username = nil
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

    it 'is not valid with a duplicate username' do
      existing_user = User.create(username: 'existinguser')
      user.username = existing_user.username.upcase # Test case-insensitive uniqueness
      expect(user).not_to be_valid
    end

    it 'requires a unique email as username (case-insensitive)' do
      existing_user = User.create(username: 'test@test.com')
      user.username = existing_user.username.upcase
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
