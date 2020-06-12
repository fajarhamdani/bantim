module KelompoksHelper
  def show_person_status(status)
    return 'Menikah' if ['janda', 'duda'].include? status

    formater_status(status)
  end

  def show_date_of_birth(date)
    date.strftime('%d %b %Y')
  rescue
    '-'
  end

  def formater_status(status)
    status.split(/ |\_/).map(&:capitalize).join(' ')
  end
end