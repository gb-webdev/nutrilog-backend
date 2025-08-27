require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "is valid with valid attributes" do
    stew = Entry.create(meal_type:"Dinner", calories:525, proteins:25, carbs:490, fats:10)
    expect(stew).to be_valid
end

  it "is not valid without a meal type" do
    stew = Entry.create(calories:525)
    expect(stew.errors[:meal_type]).to_not be_empty
  end

  it "is not valid without a meal type" do
    stew = Entry.create(meal_type:"Dinner")
    expect(stew.errors[:calories]).to_not be_empty
  end

  it "is not valid without a meal type" do
    stew = Entry.create(meal_type:"Dinner")
    expect(stew.errors[:proteins]).to_not be_empty
  end

  it "is not valid without a meal type" do
    stew = Entry.create(meal_type:"Dinner")
    expect(stew.errors[:carbs]).to_not be_empty
  end

  it "is not valid without a meal type" do
    stew = Entry.create(meal_type:"Dinner")
    expect(stew.errors[:fats]).to_not be_empty
  end
end
