class Movie < ApplicationRecord
  scope :today_top_3, -> do
    where("created_at >= :start_date AND created_at <= :end_date",
          {
            start_date: Time.now.at_beginning_of_day,
            end_date: Time.now.at_end_of_day
        }).order(sessions: :desc, created_at: :desc).limit(3)
  end

  validates :title, presence: false
end
