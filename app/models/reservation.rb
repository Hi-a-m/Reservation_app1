class Reservation < ApplicationRecord

    belongs_to :user, optional: true #nilを許可する
    belongs_to :room, optional: true
    #下記確認
    has_one_attached :image

    validates :start_date,presence: true
    validates :end_date,presence: true
    #validates :number,presence: true,numericality: true,inclusion: {in: 1..10}
    validate :start_end_check
    

    def start_end_check
      if start_date.present? && start_date.present?
        if end_date < start_date
          errors.add(:end_date,"は開始日より後の日付を入力してください")
        end
      end
    end

end