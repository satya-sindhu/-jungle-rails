require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
        it 'should not save when the password field is left blank' do
            @user = User.new(first_name: 'Yuti', last_name: 'Reswick', email: 'yuti@test.com', password: nil, password_confirmation: 'password')
      
            expect(@user).not_to be_valid
          end
      
          it 'should not save when the password confirmation field is left blank' do
            @user = User.new(first_name: 'Yuti', last_name: 'Reswick', email: 'yuti@test.com', password: 'password', password_confirmation: nil)
      
            expect(@user).not_to be_valid
          end
    end
end