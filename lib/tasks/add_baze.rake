namespace :add_baze do
  desc "add baze prod db"
  task add_baze: :environment do
    Bazesprod.delete_all
    data = Roo::Spreadsheet.open('lib/excel/PartikasGrozsDati.xlsx')
    @headers = false
    data.each(prodnos: 'Uzturlīdzeklis', olb: 'Olb.v', tauki: 'Tauki', oglh: 'Ogļh.', kcal: 'kcal', A: 'A', B1: 'B1', B2: 'B2', C: 'C',
              Ca: 'Ca', P: 'P', Fe: 'Fe') do |hash|
      if !@headers
        @headers = true
        puts 'skip first row'
        next
      else
        Bazesprod.new(hash).save!
        puts 'added row'
      end
    end
    puts "DONE"
  end
end