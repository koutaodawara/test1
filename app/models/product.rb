class Product < ActiveRecord::Base
  belongs_to :users
  belongs_to :group
end
