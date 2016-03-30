# require 'ice_cube_methods'

class Consultation < ActiveRecord::Base
  # include IceCubeMethods
  
  belongs_to :calendar
  belongs_to :user
  belongs_to :account
  validates :name, presence: true, length: { minimum: 3 }
  validates_presence_of :user_id
  validates_presence_of :account_id

  #
  validates_presence_of :calendar_id
  validates_presence_of :from_date
  validates_presence_of :to_date
  validates_presence_of :time_zone
  validates_presence_of :from_time, :if => :not_all_day?
  validates_presence_of :to_time, :if => :not_all_day?

  
  def color
    if calendar.color
      calendar.color
    else
      'lightblue'
    end
  end
  
  def not_all_day?
    if is_all_day
      return false
    else
      return true
    end
  end

  def start_time
    # 'light brown'
    if not_all_day?
      from_time.strftime "%I:%M %p (%Z)"
    else
      "all day"
    end
  end

  def get_start
    start_date = from_date.strftime "%d/%m/%Y"
    start_clock = start_time
    start_array = Array.new
    start_array << start_date
    start_array << start_clock
    start_time = start_array.join(" ").to_s
  end
  
end
