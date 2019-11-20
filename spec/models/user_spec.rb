require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to be_empty
    end

    it "is invalid without a first name" do
      @user = User.create(first_name: nil, last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages_for(:first_name).first).to eq("First name can't be blank")
    end

    it "is invalid without a last name" do
      @user = User.create(first_name: 'Jackson', last_name: nil, email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages_for(:last_name).first).to eq("Last name can't be blank")
    end

    it "is invalid without an email" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: nil, password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages_for(:email).first).to eq("Email can't be blank")
    end

    it "is invalid without a password" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: nil, password_confirmation: 'password')
      expect(@user.errors.full_messages_for(:password).first).to eq("Password can't be blank")
    end

    it "is invalid with a password shorter than 3 characters" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'pa', password_confirmation: 'pa')
      expect(@user.errors.full_messages_for(:password).first).to eq("Password is too short (minimum is 3 characters)")
    end

    it "is invalid without a password confirmation" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: nil)
      expect(@user.errors.full_messages_for(:password_confirmation).first).to eq("Password confirmation can't be blank")
    end

    it "is invalid if email has been used before" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      @user = User.create(first_name: 'Jake', last_name: 'fantin', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages_for(:email).first).to eq("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate a user if they exist in the database (not return nil)" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(User.authenticate_with_credentials('jackson@stark.com', 'password').first_name).to eq("Jackson")
    end

    it "should return nil if the user does not exist in the database" do
      expect(User.authenticate_with_credentials('jackson@stark.com', 'password')).to be_nil
    end

    it "should authenticate a user if they exist even if their email is not correctly cased" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(User.authenticate_with_credentials('JACKson@stark.com', 'password').first_name).to eq("Jackson")
    end

    it "should authenticate a user if they exist even if their email has trailing or leading spaces" do
      @user = User.create(first_name: 'Jackson', last_name: 'stark', email: 'jackson@stark.com', password: 'password', password_confirmation: 'password')
      expect(User.authenticate_with_credentials('  jackson@stark.com', 'password').first_name).to eq("Jackson")
    end
  end

end
