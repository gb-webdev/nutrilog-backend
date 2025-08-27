class Entry < ApplicationRecord
    validates :meal_type, :calories, :proteins, :carbs, :fats, presence: true
end
