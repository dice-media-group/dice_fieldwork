class Calendar < ActiveRecord::Base
  has_many :consultations, :dependent => :destroy
  validates_presence_of :name, :color
end
