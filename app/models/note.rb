class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true, :inverse_of => :notes
end
