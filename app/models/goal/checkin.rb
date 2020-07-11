class Goal::Checkin < ApplicationRecord
  self.table_name = 'goal_checkins'

  belongs_to :goal
end
