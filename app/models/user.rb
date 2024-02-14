class User < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :schedule_memo, length: { maximum: 500 }
    validate :end_day_is_before_start_day

    def end_day_is_before_start_day
     return false if end_day.blank? && start_day.blank?
      if end_day < start_day
        errors.add(:end_day_is_before_start_day,"終了日は今日以降の日付で選択してください")
     end
    end
end
