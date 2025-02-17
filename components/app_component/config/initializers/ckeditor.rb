# Use this hook to configure ckeditor
Ckeditor.setup do |config|
  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default), :mongo_mapper and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require "ckeditor/orm/mongoid"

  # Allowed image file types for upload.
  # Set to nil or [] (empty array) for all file types
  # By default: %w(jpg jpeg png gif tiff)
  # config.image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]

  # Allowed attachment file types for upload.
  # Set to nil or [] (empty array) for all file types
  # By default: %w(doc docx xls odt ods pdf rar zip tar tar.gz swf)
  # config.attachment_file_types = ["doc", "docx", "xls", "odt", "ods", "pdf", "rar", "zip", "tar", "swf"]

  # Setup authorization to be run as a before filter
  # By default: there is no authorization.
  config.authorize_with :pundit

  # Asset model classes
  config.picture_model = AppComponent::Ckeditor::Picture
  # config.parent_controller = 'Pictures::PicturesController'
  # config.attachment_file_model { Ckeditor::AttachmentFile }

  # Paginate assets
  # By default: 24
  # config.default_per_page = 24

  # Customize ckeditor assets path
  # By default: nil
  # config.asset_path = "http://www.example.com/assets/ckeditor/"

  # To reduce the asset precompilation time, you can limit plugins and/or languages to those you need:
  # By default: nil (no limit)
  config.assets_languages = ['en', 'uk']
  config.assets_plugins = ['image', 'smiley']
end

# I have to add this because i am getting error
# app/controllers/ckeditor/application_controller.rb:1:in `<top (required)>':
# unitialized constant ApplicationController (NameError)
ApplicationController = Class.new(Core::ApplicationController)
