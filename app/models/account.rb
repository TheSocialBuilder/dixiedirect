class Account
  
  
  # Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::TaggableOn
  
  
  # Fields
  
  field :name, type: String
  field :website, type: String
  field :keywords, type: String
  field :year, type: String
  field :status, type: Boolean
  
  slug :name, history: true
  taggable_on :keywords
  
  mount_uploader :logo, LogoUploader
  
  # Associations
  belongs_to :category
  has_many :advertisements, dependent: :delete
  embeds_many :locations, as: :locatable, :cascade_callbacks => true
  
  # Attributes
  attr_accessible :name, :website, :keywords, :status, :year
  attr_accessible :advertisements_attributes, :locations_attributes
  attr_accessible :logo

  accepts_nested_attributes_for :advertisements, :locations

  # Callbacks
  # before_save :format_phone
  
  # Validations

  
  # Scopes


  # Methods
  
end
