class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  mount_uploader :icon, ImageUploader #追記 iconカラムにアップローダーを紐づけてますよという内容



end

#対応するデータベースのテーブルを用意しない場合は、
#self.abstract_class = true を書く必要があります。