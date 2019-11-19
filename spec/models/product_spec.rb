require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do

    it "is valid with valid attributes" do
      @category = Category.new
      @product = Product.create(name: "Anything", price: 333, quantity: 2, category: @category)
      expect(@product.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      @category = Category.new
      @product = Product.create(name: nil, price: 333, quantity: 2, category: @category)
      expect(@product.errors.full_messages_for(:name).first).to eq("Name can't be blank")
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = Product.create(name: "Anything", price: nil, quantity: 2, category: @category)
      expect(@product.errors.full_messages_for(:price).first).to eq("Price is not a number")
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.create(name: "Anything", price: 333, quantity: nil, category: @category)
      expect(@product.errors.full_messages_for(:quantity).first).to eq("Quantity can't be blank")
    end

    it "is not valid without a category" do
      @product = Product.create(name: "Anything", price: 333, quantity: 2, category: nil)
      expect(@product.errors.full_messages_for(:category).first).to eq("Category can't be blank")
    end
  end
end
