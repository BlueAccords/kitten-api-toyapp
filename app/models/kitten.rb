class Kitten < ActiveRecord::Base
	validates :name, presence: true
	validates :age, presence: true
	validates :cuteness, presence: true, length: { minimum: 1, maximum: 5 }
	validates :softness, presence: true, length: { minimum: 1, maximum: 5 }
end
