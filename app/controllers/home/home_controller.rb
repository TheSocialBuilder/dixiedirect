require 'open-uri'
require 'json'

class Home::HomeController < ApplicationController
  layout "home"
  
  def index
    @testimonials ||= Testimonial.limit(2)
  end

  def get_data
    
    
    result = JSON.parse(open("http://dixiedirectcard.com/test.php").read)
    
    result.each do |biz|
      
      category = Category.find_by(:internal_id => biz['category_id'])
      # raise category.to_json
      
      account = Account.where(name: biz['business']).find_or_initialize_by
      
      
      if account.name.nil?
        
        account.category = category
        account.name = biz['business']
        account.website = biz['website']
        account.keywords = biz['keywords']
        account.status = biz['status']
        account.year = biz['year']
        account.remote_logo_url = "http://dixiedirectcard.com/logos/#{biz['logo']}"
      
        # Save the account so that the ads image uploaders can access it
        account.save
      
        advert = account.advertisements.new
        advert.deal = biz['deal']
        advert.type = "normal"
        advert.year = biz['year']
        advert.remote_image_url = "http://dixiedirectcard.com/ads/#{biz['image']}"
        advert.save
      
        if biz['free_deal'] != ""
          advert = account.advertisements.new
          advert.deal = biz['free_deal']
          advert.type = "free"
          advert.year = biz['year']
          advert.remote_image_url = "http://dixiedirectcard.com/ads/#{biz['free_image']}"
          advert.save
        end
      
        biz['locations'].each do |location|
          loc = account.locations.new
          loc.address = location['address']
          loc.city = location['city']
          loc.state = location['state']
          loc.zip = location['zip']
          loc.phone = location['phone']
          loc.save
        end
      

        account.save
      
        soul = Soulmate::Loader.new("accounts")
        soul.add("term" => account.name, "id" => account.id, "data" => {"url" => account_url(account), "year" => account.year})
      
      end
      # raise "1 Finished"
      
    end
    raise "Finished"
    

  end

end
