class Nevelprod < ApplicationRecord
  belongs_to :user
  validates :prod_nos, presence: true
  validate :product_name_with_id, on: %i[new edit create update]

  def product_name_with_id
    if Nevelprod.exists?(user_id: self.user_id, prod_nos: self.prod_nos) == true
      errors.add("Produkts","ar tādu nosaukumu jau bija pievienots")
    end
  end

end
