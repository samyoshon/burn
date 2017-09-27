class Banner < ActiveRecord::Base
  belongs_to :user
  belongs_to :market
end
