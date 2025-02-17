module AppComponent
  class CkeditorPictureUploader < ::CarrierWave::Uploader::Base
    include ::Ckeditor::Backend::CarrierWave

    # Include RMagick or ImageScience support:
    # include CarrierWave::RMagick
    include ::CarrierWave::MiniMagick
    # include CarrierWave::ImageScience

    # Choose what kind of storage to use for this uploader:
    storage :file

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/ckeditor/pictures/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # Process files as they are uploaded:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    process :read_dimensions

    version :thumb do
      process resize_to_fill: [50, 50]
      process quality: 70
    end

    version :medium do
      process resize_to_fill: [800, 455]
      process quality: 75
    end

    version :content do
      process resize_to_limit: [800, 800]
      process quality: 75
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      ::Ckeditor.image_file_types
    end
  end
end
