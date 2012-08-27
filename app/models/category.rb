class Category
  
  # Includes
  include Mongoid::Document
  
  # Fields
  field :name
  field :slider_id
  field :internal_id, :type => Integer
  
  
  # Associations
  has_many :accounts
  
  # Attributes
  attr_accessible :name, :slider_id
  
  # Validations
  validates_presence_of :name
  
  # Scopes
  
  
  # Callbacks
  
  
  # Methods
  
end