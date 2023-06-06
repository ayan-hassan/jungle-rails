require 'rails_helper'

RSpec.describe Product, type: :model do

  # before(:each) do 
  #   @product = Product.create! (name: "Azalea", price: 50, quantity: 20, category: "Evergreens")
  # end
  
  describe 'Validations' do
    category = Category.new(name: "Evergreens")
    
    subject { Product.new(name: "Azalea", price: 5000, quantity: 10, category: category) }
    
    it "all fields filled out" do
      expect(subject).to be_valid 
    end

    it "name missing" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end
    
    it "price missing" do 
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it "quantity missing" do 
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it "category missing" do 
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end

  end
end
