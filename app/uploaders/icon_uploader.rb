class IconUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_fit: [400, 200]

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  #これは、carrierwaveを通じた画像のアップロード先をどこにするのかを指定しており、指定されたディレクトリに、アップロードされたファイルが保存されていくことになります。
  #DBに保存されるのは、ファイルそのものではなく、ファイルへの参照データになります.

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def default_url
    'default-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png'
  end
  #デフォルトでの画像を指定しています。
  #プレビューでは最初にここで指定した画像が表示されます。

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
  #アップロードできる拡張子を制限します。
  
end
