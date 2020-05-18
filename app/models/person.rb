class Person < ApplicationRecord
	extend FriendlyId
  friendly_id :fullname, use: :slugged

  validates :fullname, presence: true
  validates_uniqueness_of :fullname, case_sensitive: false

	belongs_to :kelompok

	delegate :name, to: :kelompok, prefix: true
	delegate :name, to: :desa, prefix: true
end
