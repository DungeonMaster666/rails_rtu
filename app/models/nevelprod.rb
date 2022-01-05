class Nevelprod < ApplicationRecord
  belongs_to :user
  validates :prod_nos, presence: true, uniqueness: true
end
