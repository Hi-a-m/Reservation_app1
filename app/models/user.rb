class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader #追記 iconカラムにアップローダーを紐づけてますよという内容

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  

end
