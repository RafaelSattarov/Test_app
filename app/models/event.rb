class Event < ActiveRecord::Base
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 15 }
  validates :period,  :presence => true

end
