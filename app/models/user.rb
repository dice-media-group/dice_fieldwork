class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :consultations
  has_many :accounts, :through => :consultations
  has_many :service_agreements
  # def email
  #   name = Guest.email
  # end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
