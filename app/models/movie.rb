# frozen_string_literal: true

class Movie < ApplicationRecord
  scope :today_top, lambda { |record_limit|
    where('created_at >= :start_date AND created_at <= :end_date',
          {
            start_date: Time.zone.now.at_beginning_of_day,
            end_date: Time.zone.now.at_end_of_day
          }).order(sessions: :desc).limit(record_limit)
  }

  validates :title, presence: false
end
