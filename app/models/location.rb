class Location
  
  
  ## includes ##
  include Mongoid::Document
  # include Mongoid::Timestamps
  
  
  
  ## fields ##
  field :coordinates, :type => Array
  field :address, type: String
  field :address_formatted, type: String
  field :address_1, type: String
  field :address_2, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :city, type: String
  field :state, type: String
  field :state_code, type: String
  field :zip, type: String
  field :phone, type: String
  

  ## associations ##
  embedded_in :locatable, polymorphic: true
  
  ## validations ##
  attr_accessible :coordinates, :address, :address_formatted, :address_1, :address_2, :latitude, :longitude, :city, :state, :state_code, :zip, :phone
  
  ## scopes ##
  
  before_save :format_phone
  
  ## callbacks ##
  include Geocoder::Model::Mongoid
  geocoded_by :address_info
  after_validation :geocode
  
  ## methods ##
  
  geocoded_by :address_info do |obj,results|
    if geo = results.first
      
      
      # raise geo.to_yaml
      #$redis.set :address, geo.to_json
      obj.latitude     = geo.latitude
      obj.longitude    = geo.longitude
      obj.coordinates  = geo.coordinates
      obj.city         = geo.city
      
      
      address_info_1 = geo.address_components_of_type(:street_number).first
      address_info_2 = geo.address_components_of_type(:route).first
      
      if address_info_1
        obj.address_1 = address_info_1['long_name'] 
        obj.address_1 += " #{address_info_2['long_name']}" if address_info_2
        obj.address = "#{obj.address_1}"
        obj.address += " #{obj.address_2}" if obj.address_2
      end
      
      
      
      obj.state        = geo.state_code
      obj.zip          = geo.postal_code
      obj.address_formatted = geo.address.gsub(', USA', '')
      # raise geo.to_yaml
    end  
  end

  def address_info
    [address, city, state, zip].compact.join(' ')
  end
  
  # Clean up the phone and format it correctly
  def format_phone
    if Phoner::Phone.valid? self.phone
      pn = Phoner::Phone.parse phone, :country_code => '1'
      self.phone = pn.format("(%a) %f-%l")
    end
  end
  
  
end