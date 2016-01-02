class Account < ActiveRecord::Base
  has_many :addresses
end
