class Entry < ApplicationRecord
    validates :meal_type, :calories, :proteins, :carbs, :fats, presence: true
    validates :meal_type, length: { in: 2..26}
    validates :calories, :proteins, :carbs, :fats, numericality: { greater_than: -1, less_than: 1_000_000 }
end
