namespace :db do
  desc 'Generate desa kelompok'
  task generate_desa_kelompok: :environment do
    puts 'Starting generate desa and kelompok ......'

    list_of_desa = [
                {
                  name: 'Arcamanik',
                  abr: 'Arcamanik',
                  kelompoks: [
                    { abr: 'Boling', name: 'Boling' },
                    { abr: 'Mekarsari', name: 'Mekarsari' },
                    { abr: 'Sarimas', name: 'Sarimas' },
                    { abr: 'Mandalajati', name: 'Mandalajati' },
                    { abr: 'Jatiwangi', name: 'Jatiwangi' },
                    { abr: 'Indramayu', name: 'Indramayu' }
                  ]
                },
                {
                  name: 'Babakan Sari',
                  abr: 'Baksar',
                  kelompoks: [
                    { abr: 'Arum Sari 1', name: 'Arum Sari 1' },
                    { abr: 'Arum Sari 1', name: 'Arum Sari 1' },
                    { abr: 'Baksum', name: 'Babakan Sumedang' },
                    { abr: 'Atlas', name: 'Atlas' }
                  ]
                },
                {
                  name: 'Cicadas',
                  abr: 'Cicadas',
                  kelompoks: [
                    { abr: 'Ampera', name: 'Ampera' },
                    { abr: 'Wiranta', name: 'Wiranta' },
                    { abr: 'Padasuka', name: 'Padasuka' },
                    { abr: 'Cicaheum 1', name: 'Cicaheum 1' },
                    { abr: 'Cicaheum 2', name: 'Cicaheum 2' }
                  ]
                },
                {
                  name: 'Karees Selatan',
                  abr: 'Karsel',
                  kelompoks: [
                    { abr: 'Sekejati', name: 'Sekejati' },
                    { abr: 'Baja', name: 'Babakan Jati' },
                    { abr: 'Jatimulya', name: 'Jatimulya' },
                    { abr: 'Talbo', name: 'Talaga Bodas' },
                    { abr: 'Binong', name: 'Binong' },
                    { abr: 'Warjam', name: 'Warung Jambu' },
                    { abr: 'Kawaluyaan', name: 'Kawaluyaan' }
                  ]
                },
                {
                  name: 'Karees Utara',
                  abr: 'Karut',
                  kelompoks: [
                    { abr: 'Bondang', name: 'Kebon Gedang' },
                    { abr: 'Maleer', name: 'Maleer' },
                    { abr: 'Cibangkong', name: 'Cibangkong' },
                    { abr: 'Anyer', name: 'Anyer' },
                    { abr: 'Cikaso', name: 'Cikaso' },
                    { abr: 'Malabar', name: 'Malabar' }
                  ]
                }
              ]

    list_of_desa.each do |desa|
      created_desa = Desa.create(name: desa[:name], abr: desa[:abr])
      
      kelompoks = []
      desa[:kelompoks].each do |kelompok|
        kelompoks << kelompok.merge(desa_id: created_desa.id)
      end

      Kelompok.create(kelompoks)
    end

    puts 'Finish'
  end

  desc 'Generate dummy person'
  task generate_dummy_person: :environment do
    next if Kelompok.count.zero?
    puts 'Starting generate dummy data .........'
      
    kelompoks = Kelompok.all

    kelompoks.each_with_index do |kelompok, index|
      people = []
      person_counting = (index%2).even? ? 100 : 87

      person_counting.times do |i|
        date = random_date
        education = random_education(date)

        people << { 
          kelompok_id: kelompok.id,
          fullname: "Person #{kelompok.id} #{i}",
          nickname: "#{kelompok.id} #{i}",
          address: "Jalan jalan ke nomor #{kelompok.id} #{i}",
          place_of_birth: ['Bandung','Jakarta','Lampung','Kediri','Garut','Jayapura','Melbourne'].sample,
          date_of_birth: date,
          blood_type: random_number(0..3),
          status: random_number(0..3) ,
          phone_number: "0987654#{kelompok.id} #{i}",
          sex: random_number(0..1),
          education: education,
          expertise: "Service Mesin Jahit"
        }
      end

      Person.create(people)
    end

    puts 'Finish'
  end

  private

  def random_number(between)
    Random.new.rand(between)
  end

  def random_date
    current_year = Date.current.year

    "#{random_number(1..28)}/#{random_number(1..12)}/#{random_number(1960..current_year)}"
  end

  def random_education(date)
    case date.to_date.year
    when 0..5
      nil
    when 6..12
      0
    when 13..15
      [0, 1].sample
    when 16..18
      [0, 1, 2, 3].sample
    else
      [0, 1, 2, 3, 4, 5, 6, 7, 8].sample
    end
  end
end