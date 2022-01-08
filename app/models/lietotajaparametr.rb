class Lietotajaparametr < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  validates :svars, presence: true, format: { with: /\A([1-9]\d\d?)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :augums, presence: true, format: { with: /\A([1-9]\d|[1-2]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }
  validates :vecums, presence: true, format: { with: /\A([1-9]|[1-9]\d|[1-9]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }
  validates :dzimums, presence: true, format: { with: /\A[S|V]\Z/, message: '- Ievadiet tikai S vai V' }

  enum koef: {
    "Neaktīvs" => 1.2,
    "Mazāk aktīvs" => 1.5,
    "Vidēji aktīvs" => 1.5,
    "Vairāk aktīvs" => 1.7,
    "Ļoti aktīvs"=> 1.9
  }

  enum goal: {
    'Tagadēja svara saglabāšana' => 0,
    'Samazināt' => 1,
    'Muskulatūras palielināšana' => 2,
    'Svara samazināšana un muskulatatūras palielināšana' => 3,
    'Massas palielināšana' => 4
  }
end
