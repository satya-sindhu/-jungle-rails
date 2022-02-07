require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do

        it 'should create a user when all fields are filled in correctly' do
            @user = User.new(first_name: 'Darren', last_name: 'Brown', email: 'yuti@test.com', password: 'password', password_confirmation: 'password')
      
            expect(@user).to be_valid
          end
      


        it 'should not save when the password field is left blank' do
            @user = User.new(first_name: 'Darren', last_name: 'Brown', email: 'Darren@test.com', password: nil, password_confirmation: 'password')
      
            expect(@user).not_to be_valid
          end
      
          it 'should not save when the password confirmation field is left blank' do
            @user = User.new(first_name: 'Darren', last_name: 'Brown', email: 'Darren@test.com', password: 'password', password_confirmation: nil)
      
            expect(@user).not_to be_valid
          end

          it 'should not save when the first name field is left blank' do
            @user = User.new(first_name: nil, last_name: 'Brown', email: 'Darren@test.com', password: 'password', password_confirmation: 'password')
      
            expect(@user).not_to be_valid
          end
      
          it 'should not save when the last name field is left blank' do
            @user = User.new(first_name: 'Darren', last_name: nil, email: 'Darren@test.com', password: 'password', password_confirmation: 'password')
      
            expect(@user).not_to be_valid
          end

          it 'should not save when the password and password confirmation do not match' do
            @user = User.new(first_name: 'Darren', last_name: 'Brown', email: 'yuti@test.com', password: 'password', password_confirmation: 'password123')
      
            expect(@user).not_to be_valid
          end
      
          it 'should not save if the user email already exists' do
            @user1 = User.new(first_name: 'Darren', last_name: 'Brown', email: 'Darren@test.com', password: 'password', password_confirmation: 'password')
            @user1.save
            @user2 = User.new(first_name: 'Darren', last_name: 'Brown', email: 'Darren@test.com', password: '12345678', password_confirmation: '12345678')
      
            expect(@user2).not_to be_valid
          end

          it 'should not save if the password is less than 8 characters' do
            @user = User.new(first_name: 'Darren', last_name: 'Brown', email: 'yuti@test.com', password: '123', password_confirmation: '123')
      
            expect(@user).not_to be_valid
          end
    end
end