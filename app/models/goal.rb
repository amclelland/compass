class Goal < ApplicationRecord
  belongs_to :user
  has_many :checkins, class_name: 'Goal::Checkin'

  def progress
    return 0 if checkins.blank?

    checkins.last.progress
  end
end
