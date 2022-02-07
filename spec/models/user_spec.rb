require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
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
    end
end