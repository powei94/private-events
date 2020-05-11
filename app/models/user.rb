class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: "creator_id", dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, dependent: :destroy, source: :event

  def upcoming_events
    events = self.attended_events.select do |event|
      event.start_time.future?
    end
  end

  def previous_events
    events = self.attended_events.select do |event|
      event.start_time.past?
    end
  end
end
