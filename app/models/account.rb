class Account
  
  
  # Includes
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  # Fields
  field :name, type: String
  field :website, type: String
  field :keywords, type: String
  field :year, type: String
  field :status, type: Boolean
  
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
  
  # Clean up the phone and format it correctly
  def format_phone
    if Phoner::Phone.valid? self.phone
      pn = Phoner::Phone.parse phone, :country_code => '1'
      self.phone = pn.format("(%a) %f-%l")
    end
  end
  
  # Format the users full name
  # def name
  #   "#{self.first_name} #{self.last_name}"
  # end

end
