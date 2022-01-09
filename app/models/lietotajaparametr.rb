class Lietotajaparametr < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  validates :svars, presence: true, format: { with: /\A([1-9]\d\d?)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :augums, presence: true, format: { with: /\A([1-9]\d|[1-2]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }
  validates :vecums, presence: true, format: { with: /\A([1-9]|[1-9]\d|[1-9]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }

  enum koef: {
    "Neaktīvs (sēdošs dzīvesveids, fiziskas aktivitātes ar mazu intensitāti vai vispār nav)" => 1.2,
    "Mazāk aktīvs (vieglas fiziskas aktivitātes 1-3 reizes nedēļā)" => 1.3,
    "Vidēji aktīvs (vidēji sarežģīts fizisks darbs vai fiziskas aktivitātes ar vidēju intensitāti 3-5 reizes nedēļā)" => 1.5,
    "Vairāk aktīvs (fizisks darbs un fiziskas nodarbības, vai tikai intensīvas nodarbības 6-7 reizes nedēļā)" => 1.7,
    "Ļoti aktīvs (fizisks darbs un ļoti intensīvas sporta nodarbības)"=> 1.9
  }

  enum goal: {
    'Tagadēja svara saglabāšana' => 0,
    'Samazināt svaru' => 1,
    'Muskulatūras palielināšana' => 2,
    'Svara samazināšana un muskulatatūras palielināšana' => 3,
    'Masas palielināšana' => 4
  }

  enum dzimums: {
    'Sieviešu' => 'S',
    'Vīriešu' => 'V'
  }

end
