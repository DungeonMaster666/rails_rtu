class Lietotajaparametr < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  validates :svars, presence: true, format: { with: /\A([1-9]\d\d?)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :augums, presence: true, format: { with: /\A([1-9]\d|[1-2]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }
  validates :vecums, presence: true, format: { with: /\A([1-9]|[1-9]\d|[1-9]\d\d)\Z/, message: '- Ievadiet tikai vienu veselo skaitli' }
  validates :dzimums, presence: true, format: { with: /\A[S|V]\Z/, message: '- Ievadiet tikai S vai V' }
  validates :koef, presence: true, format: { with: /\A([1-9]\d?)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :goal, presence: true, format: { with: /\A([1-9]\d?)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }


end
