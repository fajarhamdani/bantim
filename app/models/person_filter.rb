class PersonFilter
  def initialize(category:)
    @category = category
    @current_date = Date.current
  end

  def run
    result = case @category
      when 'balita'
        Person.where(
          "status = ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_BALITA), @current_date
          )
      when 'caberawit'
        Person.where(
          "status = ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_CABERAWIT), min_date_of_birth(AGE_OF_CABERAWIT)
          )
      when 'pra_remaja'
        Person.where(
          "status = ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_PRA_REMAJA), min_date_of_birth(AGE_OF_PRA_REMAJA)
          )
      when 'remaja'
        Person.where(
          "status = ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_REMAJA), min_date_of_birth(AGE_OF_REMAJA)
          )
      when 'muda_mudi'
        Person.where(
          "status = ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_MUDA_MUDI), min_date_of_birth(AGE_OF_MUDA_MUDI)
          )
      when 'pembina'
        Person.where(
          "status != ? AND date_of_birth BETWEEN ? AND ?", 0, max_date_of_birth(AGE_OF_PEMBINA), min_date_of_birth(AGE_OF_MUDA_MUDI)
          )
      when 'lansia'
        Person.where(
          "date_of_birth BETWEEN ? AND ?", max_date_of_birth(AGE_OF_LANSIA), min_date_of_birth(AGE_OF_LANSIA)
          )
      else
        Person.all
      end

    [result.female, result.male]
  end

  private

  def min_date_of_birth(age)
    @current_date - age.min.years
  end

  def max_date_of_birth(age)
    @current_date - age.max.years
  end
end