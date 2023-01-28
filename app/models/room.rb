class Room < ApplicationRecord

        belongs_to :user,optional: true
        has_many :reservations_path
        
        has_one_attached :image
        
        validates :room_name, presence: true
        validates :image, presence: true
        validates :price, presence: true
        validates :address, presence: true
        validates :introduction, presence: true
      
        def self.room_search(search)
          if search != ""
            Room.where('text LIKE(?)', "%#{search}%")
          else
            Room.all
          end
        end
        #if search != ""とすることで、検索フォームに何か値が入力されていた場合を条件としている。

end