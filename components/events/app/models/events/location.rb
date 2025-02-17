module Events
  class Location
    include Mongoid::Document
    include Core::ModelMethods

    ATTRIBUTES = %i( latitude longitude information )

    field :latitude
    field :longitude
    field :information

    embedded_in :event, class_name: 'Events::Event'

    validates *ATTRIBUTES, presence: true
  end
end
