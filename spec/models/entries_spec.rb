require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "is valid with valid attributes" do
    stew = Entry.create(meal_type: "Dinner", calories: 525, proteins: 25, carbs: 490, fats: 10)
    expect(stew).to be_valid
end

  it "is not valid without a meal type" do
    stew = Entry.create(calories: 525)
    expect(stew.errors[:meal_type]).to_not be_empty
  end

  it "is not valid without calories" do
    stew = Entry.create(meal_type: "Dinner")
    expect(stew.errors[:calories]).to_not be_empty
  end

  it "is not valid without proteins" do
    stew = Entry.create(meal_type: "Dinner")
    expect(stew.errors[:proteins]).to_not be_empty
  end

  it "is not valid without carbs" do
    stew = Entry.create(meal_type: "Dinner")
    expect(stew.errors[:carbs]).to_not be_empty
  end

  it "is not valid without fats" do
    stew = Entry.create(meal_type: "Dinner")
    expect(stew.errors[:fats]).to_not be_empty
  end

  it "Has meal type between 2-26 characters" do
    small_stew = Entry.create(meal_type: "D", calories: 525, proteins: 25, carbs: 490, fats: 10)
    expect(small_stew.errors[:meal_type]).to_not be_empty

    big_stew = Entry.create(meal_type: "The most delicious meal on the planet", calories: 525, proteins: 25, carbs: 490, fats: 10)
    expect(big_stew.errors[:meal_type]).to_not be_empty

  end

  it "Has all number entries to be between -1 & 1,000,000" do
    negative_calories = Entry.create(meal_type: "soup", calories: -1, proteins: 25, carbs: 490, fats: 10)
    expect(negative_calories.errors[:calories]).to_not be_empty

    negative_proteins = Entry.create(meal_type: "soup", calories: 525, proteins: -1, carbs: 490, fats: 10)
    expect(negative_proteins.errors[:proteins]).to_not be_empty

    negative_carbs = Entry.create(meal_type: "soup", calories: 525, proteins: 25, carbs: -1, fats: 10)
    expect(negative_carbs.errors[:carbs]).to_not be_empty

    negative_fats = Entry.create(meal_type: "soup", calories: 525, proteins: 25, carbs: 490, fats: -1)
    expect(negative_fats.errors[:fats]).to_not be_empty

    large_calories = Entry.create(meal_type: "soup", calories: 5250000, proteins: 25, carbs: 490, fats: 10)
    expect(large_calories.errors[:calories]).to_not be_empty

    large_proteins = Entry.create(meal_type: "soup", calories: 525, proteins: 2500000, carbs: 490, fats: 10)
    expect(large_proteins.errors[:proteins]).to_not be_empty

    large_carbs = Entry.create(meal_type: "soup", calories: 525, proteins: 25, carbs: 4900000, fats: 10)
    expect(large_carbs.errors[:carbs]).to_not be_empty

    large_fats = Entry.create(meal_type: "soup", calories: 525, proteins: 25, carbs: 490, fats: 1000000)
    expect(large_fats.errors[:fats]).to_not be_empty
  end
end

