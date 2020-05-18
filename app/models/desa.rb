class Desa < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
end