class UserTrack < ApplicationRecord
  belongs_to :user
  belongs_to :track

  def added_at
    created_at.to_date
  end
end
