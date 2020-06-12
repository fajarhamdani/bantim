class Desa < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :abr, presence: true
  validates_uniqueness_of :name, :abr, case_sensitive: false

  has_many :kelompoks
  has_many :people, through: :kelompoks
  has_many :male_person, -> { male }, source: :people, through: :kelompoks
  has_many :female_person, -> { female }, source: :people, through: :kelompoks
end