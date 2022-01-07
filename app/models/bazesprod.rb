class Bazesprod < ApplicationRecord
  validates :prodnos, presence: true
  validates :olb, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :tauki, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :oglh, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :kcal, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :A, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :B1, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :B2, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :C, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :Ca, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :P, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :Fe, presence: true, format: { with: /\A([1-9]\d*|0)(\.\d+)?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :cena, presence: true, format: { with: /\A^\d+(\.\d{1,2})?\Z/, message: '- Ievadiet tikai vienu veselo skaitli vai decimalo skaitli' }
  validates :min, format: { with: /\A([1-9]\d*|0)\Z/, message: '- Ievadiet tikai veselo skaitli' }
  validates :max, format: { with: /\A([1-9]\d*)\Z/, message: '- Ievadiet tikai veselo skaitli' }


end
