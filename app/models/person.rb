require 'date'

class Person < ApplicationRecord
  enum blood_type: [:a, :b, :ab, :o]
  enum sex: [:wanita, :pria]
  enum status: [:belum_menikah, :menikah, :duda, :janda]

	extend FriendlyId
  friendly_id :fullname, use: :slugged

  validates :fullname, presence: true
  validates_uniqueness_of :fullname, case_sensitive: false

	belongs_to :kelompok

	delegate :name, to: :kelompok, prefix: true
	delegate :name, to: :desa, prefix: true

  scope :female, -> { where(sex: :wanita) }
  scope :male, -> { where(sex: :pria) }
  
  def current_status
    return calculate_marital_status if status != 'belum_menikah'

    calculate_generation_status
  end

  private

  def calculate_marital_status
    return status if age(date_of_birth) < 58

    'Lansia'
  end

  def calculate_generation_status
    case age(date_of_birth)
    when AGE_OF_BALITA
      'Balita'
    when AGE_OF_CABERAWIT
      'Caberawit'
    when AGE_OF_PRA_REMAJA
      'Pra Remaja'
    when AGE_OF_REMAJA
      'Remaja'
    when AGE_OF_MUDA_MUDI
      'Muda Mudi'
    else
      status
    end
  end

  def age(dob)
    now = Time.current.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
