module Core
  class Profile
    include Mongoid::Document
    include Core::ModelMethods

    embedded_in :user, class_name: 'Core::User'

    field :first_name
    field :last_name
    field :photo_url

    validates :first_name, :last_name, presence: true, length: { in: 2..30 }
  end
end
