class Reservation < ApplicationRecord

    belongs_to :user, optional: true #nilを許可する
    belongs_to :room, optional: true
    #下記確認
    has_one_attached :image

    validates :start_date,presence: true
    validates :end_date,presence: true
    #validates :number,presence: true,numericality: true,inclusion: {in: 1..10}
    validate :date_before_start
    validate :date_before_finish
  
    # 使用日数、合計金額を算出する計算式を追加（モデル内では別モデルの変数でもインスタンス変数の形で呼び出さない）
    #def sum_of_days
    #(end_date.to_date - start_date.to_date).to_i
    #end

    #def total_price
      #(price * people * total_day).to_i
    #end

  
    def date_before_start
      return if start_date.blank?
      errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
    end
    
    def date_before_finish
      return if end_date.blank? || start_date.blank?
      errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
    end
  
end