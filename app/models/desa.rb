class Desa < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, uniqueness: true
end
