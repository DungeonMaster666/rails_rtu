namespace :add_baze do
  desc "add baze prod db"
  task add_baze: :environment do
    Bazesprod.delete_all
    Bazesprod.create([{ :prodnos => 'Ābols', :nutrition1=> '15'},{ :prodnos => 'Piens', :nutrition1=> '30'},{ :prodnos => 'Gaļa', :nutrition1=> '50'},{ :prodnos => 'Rieksti', :nutrition1=> '7'}])
    puts "DONE"
  end
end