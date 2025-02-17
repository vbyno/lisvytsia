require_relative 'concerns/authored'
require_relative 'concerns/pictured'

module AppComponent
  class Event < Page
    include Concerns::Authored
    include Concerns::Pictured

    belongs_to :picture, class_name: 'Pictures::Picture'

    field :content_intro
    field :started_at, type: DateTime
    field :place

    embeds_many :categories, class_name: 'AppComponent::EventCategory'

    scope :related_to, ->(event) { where(:id.ne => event.id) }

    validates :content_intro, :content, :started_at, :place, presence: true
  end
end
