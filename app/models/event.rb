class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances, source: :user
    scope :past, ->{where('start_time < ?', DateTime.now)}
    scope :future, ->{where('start_time > ?', DateTime.now)}

end
