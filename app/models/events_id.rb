class EventsId < ActiveRecord::Base
has_and_belongs_to_many :editors, :class_name => "AdminUser"
end
