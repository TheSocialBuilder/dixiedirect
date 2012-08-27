class Testimonial
  
  # Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # Fields
  field :name
  field :email
  field :testimonial
  
  # Associations
  
  
  # Attributes
  attr_accessible :name, :email, :testimonial
  
  # Validations
  validates_presence_of :name
  validates_presence_of :testimonial
  
  # Scopes
  
  
  # Callbacks
  
  
  # Methods
  
end