require 'rails_helper'

RSpec.describe User, type: :model do


  user1 = User.new(firstname: "firstname", lastname: "lastname", email: "email@test5.com", password: "123456", password_confirmation: "123456") 

  describe 'Validations' do 

    it 'all fields filled out' do
      expect(user1).to be_valid
    end
    
    it "firstname missing" do
      user1.firstname = nil
      expect(user1).to_not be_valid
      expect(user1.errors.full_messages).to include("Firstname can't be blank")
    end
    
    it "lastname missing" do
      user1.lastname = nil
      expect(user1).to_not be_valid
      expect(user1.errors.full_messages).to include("Lastname can't be blank")
    end

    it "email missing" do
      user1.email = nil
      expect(user1).to_not be_valid
      expect(user1.errors.full_messages).to include("Email can't be blank")
    end

    it "password missing" do
      user1.password = nil
      expect(user1).to_not be_valid
      expect(user1.errors.full_messages).to include("Password can't be blank")
    end

    it "Password confirmation missing" do
      user1.password_confirmation = nil
      expect(user1).to_not be_valid
      expect(user1.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "password and password_confirmation don't match" do 
      user1.password_confirmation = "WRONG"
      expect(user1).to_not be_valid
    end
    
    it "password less than 6 characters" do 
      user2 = User.new(firstname: "firstname", lastname: "lastname", email: "email@test.com", password: "12345", password_confirmation: "12345") 
      expect(user1).to_not be_valid
    end
    
    it "email address not unique" do 
      user3 = User.create(firstname: "firstname", lastname: "lastname", email: "email@test2.com", password: "123456", password_confirmation: "123456") 
      user4 = User.new(firstname: "firstname", lastname: "lastname", email: "email@TEST2.com", password: "123456", password_confirmation: "123456") 
      expect(user4).to_not be_valid
    end

  end

end
