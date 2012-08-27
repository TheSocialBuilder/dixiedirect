class Advertisement
  
  # Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # Fields
  field :deal
  field :type, :default => "normal"
  field :year
  
  mount_uploader :image, ImageUploader
  
  # Associations
  belongs_to :account
  
  # Attributes
  attr_accessible :deal, :type, :year
  attr_accessible :image
  
  # Validations
  # validates_presence_of :deal
  # validates_presence_of :year
  
  # Scopes
  
  
  # Callbacks
  
  
  # Methods
  
end