class Desa < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :abr, presence: true
  validates_uniqueness_of :name, :abr, case_sensitive: false

  has_many :kelompoks
  has_many :people, through: :kelompoks
end