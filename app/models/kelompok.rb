class Kelompok < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false

	belongs_to :desa

	has_many :people

  has_many :male_person, -> { male }, class_name: 'Person'
  has_many :female_person, -> { female }, class_name: 'Person'

	delegate :name, to: :desa, prefix: true
end
