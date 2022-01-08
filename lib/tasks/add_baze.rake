namespace :add_baze do
  desc "add baze prod db"
  task add_baze: :environment do
    Bazesprod.delete_all
    data = Roo::Spreadsheet.open('lib/excel/PartikasGrozsDati_with_prices.xlsx')
    @headers = false
    data.each(prodnos: 'Uzturlīdzeklis', olb: 'Olb.v', tauki: 'Tauki', oglh: 'Ogļh.', kcal: 'kcal', A: 'A', B1: 'B1', B2: 'B2', C: 'C',
              Ca: 'Ca', P: 'P', Fe: 'Fe', max: 'g', cena: 'cena_opt') do |hash|
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
  task cena: :environment do
    bazesprod = Bazesprod.all

    bazesprod.each do |prod|
      cena = rand(0.01..7.01).round(2).to_s
      puts cena
      prod.update(cena: cena)
      puts "added element to row"
    end
  end
end
