class Classified < ActiveRecord::Base
  validates :title, :price, :email, presence: true
end
