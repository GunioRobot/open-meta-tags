require File.dirname(__FILE__) + '/spec_helper'

describe OpenMeta::ViewHelper do
  before :each do
    @view = ActionView::Base.new
  end
  
  context 'module' do
    it 'should be mixed into ActionView::Base' do
      ActionView::Base.included_modules.should include(OpenMeta::ViewHelper)
    end
    
    it 'should respond to "title" helper' do
      @view.should respond_to(:title)
    end
    
    it 'should respond to "type" helper' do
      @view.should respond_to(:type)
    end
    
    it 'should respond to "url" helper' do
      @view.should respond_to(:url)
    end

    it 'should respond to "image" helper' do
      @view.should respond_to(:image)
    end

    it 'should respond to "description" helper' do
      @view.should respond_to(:description)
    end
    
    it 'should respond to "site_name" helper' do
      @view.should respond_to(:site_name)
    end
    
    it 'should respond to "admins" helper' do
      @view.should respond_to(:admins)
    end
    
    it 'should respond to "app_id" helper' do
      @view.should respond_to(:app_id)
    end
    
    it 'should respond to "latitude" helper' do
      @view.should respond_to(:latitude)
    end
    
    it 'should respond to "longitude" helper' do
      @view.should respond_to(:longitude)
    end
    
    it 'should respond to "street_address" helper' do
      @view.should respond_to(:street_address)
    end
    
    it 'should respond to "locality" helper' do
      @view.should respond_to(:locality)
    end
    
    it 'should respond to "region" helper' do
      @view.should respond_to(:region)
    end
    
    it 'should respond to "postal_code" helper' do
      @view.should respond_to(:postal_code)
    end
    
    it 'should respond to "country_name" helper' do
      @view.should respond_to(:country_name)
    end
    
    it 'should respond to "email" helper' do
      @view.should respond_to(:email)
    end
    
    it 'should respond to "phone_number" helper' do
      @view.should respond_to(:phone_number)
    end
    
    it 'should respond to "fax_number" helper' do
      @view.should respond_to(:fax_number)
    end
    
    it 'should respond to "upc" helper' do
      @view.should respond_to(:upc)
    end
    
    it 'should respond to "isbn" helper' do
      @view.should respond_to(:isbn)
    end
    
    it 'should respond to "single_open_meta" helper' do
      @view.should respond_to(:single_open_meta)
    end

    it 'should respond to "global_open_meta" helper' do
      @view.should respond_to(:global_open_meta)
    end
  end
  
  context 'returning values' do
    it 'should return title' do
      @view.title('some-title').should == 'some-title'
    end
    
    it 'should return type' do
      @view.type('some-type').should == 'some-type'
    end
    
    it 'should return url' do
      @view.url('some-url').should == 'some-url'
    end
    
    it 'should return image' do
      @view.image('some-image').should == 'some-image'
    end
    
    it 'should return description' do
      @view.description('some-description').should == 'some-description'
    end
    
    it 'should return site_name' do
      @view.site_name('some-site_name').should == 'some-site_name'
    end
    
    it 'should return admins' do
      @view.admins('some-admins').should == 'some-admins'
    end
    
    it 'should return app_id' do
      @view.app_id('some-app_id').should == 'some-app_id'
    end
    
    it 'should return latitude' do
      @view.latitude('some-latitude').should == 'some-latitude'
    end
    
    it 'should return longitude' do
      @view.longitude('some-longitude').should == 'some-longitude'
    end
    
    it 'should return street_address' do
      @view.street_address('some-street_address').should == 'some-street_address'
    end

    it 'should return locality' do
      @view.locality('some-locality').should == 'some-locality'
    end

    it 'should return region' do
      @view.region('some-region').should == 'some-region'
    end

    it 'should return postal_code' do
      @view.postal_code('some-postal_code').should == 'some-postal_code'
    end
    
    it 'should return country_name' do
      @view.country_name('some-country_name').should == 'some-country_name'
    end
    
    it 'should return email' do
      @view.email('some-email').should == 'some-email'
    end
    
    it 'should return phone_number' do
      @view.phone_number('some-phone_number').should == 'some-phone_number'
    end
    
    it 'should return fax_number' do
      @view.fax_number('some-fax_number').should == 'some-fax_number'
    end
    
    it 'should return upc' do
      @view.fax_number('some-upc').should == 'some-upc'
    end
    
    it 'should return isbn' do
      @view.fax_number('some-isbn').should == 'some-isbn'
    end
  end
  
  # title
  context 'displaying title' do
    it 'should display title when "title" used' do
      @view.title('some-title')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-title" property="og:title" />')
    end

    it 'should display title when "single_open_meta" used' do
      @view.single_open_meta(:title => 'some-title')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-title" property="og:title" />')
    end

    it 'should display default title' do
      @view.global_open_meta(:site => 'someSite', :title => 'some-title').should include('<meta content="some-title" property="og:title" />')
    end

    it 'should use custom title if given' do
      @view.title('some-title')
      @view.global_open_meta(:site => 'someSite', :title => 'some-title').should include('<meta content="some-title" property="og:title" />')
    end
  end
  
  # type
  context 'displaying type' do
    it 'should display type when "type" used' do
      @view.type('some-type')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should display type when "single_open_meta" used' do
      @view.single_open_meta(:type => 'some-type')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should display default type' do
      @view.global_open_meta(:site => 'someSite', :type => 'some-type').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should use custom type if given' do
      @view.type('some-type')
      @view.global_open_meta(:site => 'someSite', :type => 'some-type').should include('<meta content="some-type" property="og:type" />')
    end
  end
  
  # url
  context 'displaying url' do
    it 'should display url when "url" used' do
      @view.url('some-url')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should display url when "single_open_meta" used' do
      @view.single_open_meta(:url => 'some-url')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should display default url' do
      @view.global_open_meta(:site => 'someSite', :url => 'some-url').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should use custom url if given' do
      @view.url('some-url')
      @view.global_open_meta(:site => 'someSite', :url => 'some-url').should include('<meta content="some-url" property="og:url" />')
    end
  end
  
  # image
  context 'displaying image' do
    it 'should display image when "image" used' do
      @view.image('some-image')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should display image when "single_open_meta" used' do
      @view.single_open_meta(:image => 'some-image')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should display default image' do
      @view.global_open_meta(:site => 'someSite', :image => 'some-image').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should use custom image if given' do
      @view.image('some-image')
      @view.global_open_meta(:site => 'someSite', :image => 'some-image').should include('<meta content="some-image" property="og:image" />')
    end
  end
  
  # description
  context 'displaying description' do
    it 'should display description when "description" used' do
      @view.description('some-description')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should display description when "description" used' do
      @view.single_open_meta(:description => 'some-description')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should display default description' do
      @view.global_open_meta(:site => 'someSite', :description => 'some-description').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should use custom description if given' do
      @view.description('some-description')
      @view.global_open_meta(:site => 'someSite', :description => 'some-description').should include('<meta content="some-description" property="og:description" />')
    end
  end
  
  # site_name
  context 'displaying site_name' do
    it 'should display site_name when "site_name" used' do
      @view.site_name('some-site_name')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should display site_name when "single_open_meta" used' do
      @view.single_open_meta(:site_name => 'some-site_name')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should display default site_name' do
      @view.global_open_meta(:site => 'someSite', :site_name => 'some-site_name').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should use custom site_name if given' do
      @view.site_name('some-site_name')
      @view.global_open_meta(:site => 'someSite', :site_name => 'some-site_name').should include('<meta content="some-site_name" property="og:site_name" />')
    end
  end
  
  # admins
  context 'displaying admins' do
    it 'should display admins when "admins" used' do
      @view.admins('some-admins')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-admins" property="fb:admins" />')
    end
  
    it 'should display admins when "single_open_meta" used' do
      @view.single_open_meta(:admins => 'some-admins')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-admins" property="fb:admins" />')
    end
  
    it 'should display default admins' do
      @view.global_open_meta(:site => 'someSite', :admins => 'some-admins').should include('<meta content="some-admins" property="fb:admins" />')
    end
  
    it 'should use custom admins if given' do
      @view.admins('some-admins')
      @view.global_open_meta(:site => 'someSite', :admins => 'some-admins').should include('<meta content="some-admins" property="fb:admins" />')
    end
    
    it 'should lowercase admins' do
      @view.global_open_meta(:site => 'someSite', :admins => 'some-Admins').should include('<meta content="some-admins" property="fb:admins" />')
    end

    it 'should join admins from Array' do
      @view.global_open_meta(:site => 'someSite', :admins => %w(user_id1 user_id2)).should include('<meta content="user_id1, user_id2" property="fb:admins" />')
    end

    it 'should join admins from nested Arrays' do
      @view.global_open_meta(:site => 'someSite', :admins => [%w(user_id1 user_id2), 'user_id3']).should include('<meta content="user_id1, user_id2, user_id3" property="fb:admins" />')
    end
  end
  
  # app_id
  context 'displaying app_id' do
    it 'should display app_id when "app_id" used' do
      @view.app_id('some-app_id')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should display app_id when "single_open_meta" used' do
      @view.single_open_meta(:app_id => 'some-app_id')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should display default app_id' do
      @view.global_open_meta(:site => 'someSite', :app_id => 'some-app_id').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should use custom app_id if given' do
      @view.app_id('some-app_id')
      @view.global_open_meta(:site => 'someSite', :app_id => 'some-app_id').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  end
  
  # latitude
  context 'displaying latitude' do
    it 'should display latitude when "latitude" used' do
      @view.latitude('some-latitude')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should display latitude when "single_open_meta" used' do
      @view.single_open_meta(:latitude => 'some-latitude')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should display default latitude' do
      @view.global_open_meta(:site => 'someSite', :latitude => 'some-latitude').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should use custom latitude if given' do
      @view.latitude('some-latitude')
      @view.global_open_meta(:site => 'someSite', :latitude => 'some-latitude').should include('<meta content="some-latitude" property="og:latitude" />')
    end
  end
  
  # longitude
  context 'displaying longitude' do
    it 'should display longitude when "longitude" used' do
      @view.longitude('some-longitude')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should display longitude when "single_open_meta" used' do
      @view.single_open_meta(:longitude => 'some-longitude')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should display default longitude' do
      @view.global_open_meta(:site => 'someSite', :longitude => 'some-longitude').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should use custom longitude if given' do
      @view.longitude('some-longitude')
      @view.global_open_meta(:site => 'someSite', :longitude => 'some-longitude').should include('<meta content="some-longitude" property="og:longitude" />')
    end
  end
  
  # street address
  context 'displaying street_address' do
    it 'should display street_address when "street_address" used' do
      @view.street_address('some-street_address')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should display street_address when "single_open_meta" used' do
      @view.single_open_meta(:street_address => 'some-street_address')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should display default street_address' do
      @view.global_open_meta(:site => 'someSite', :street_address => 'some-street_address').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should use custom street_address if given' do
      @view.street_address('some-street_address')
      @view.global_open_meta(:site => 'someSite', :street_address => 'some-street_address').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  end
  
  # locality
  context 'displaying locality' do
    it 'should display locality when "locality" used' do
      @view.locality('some-locality')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should display locality when "single_open_meta" used' do
      @view.single_open_meta(:locality => 'some-locality')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should display default locality' do
      @view.global_open_meta(:site => 'someSite', :locality => 'some-locality').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should use custom locality if given' do
      @view.locality('some-locality')
      @view.global_open_meta(:site => 'someSite', :locality => 'some-locality').should include('<meta content="some-locality" property="og:locality" />')
    end
  end
  
  # region
  context 'displaying region' do
    it 'should display region when "region" used' do
      @view.region('some-region')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should display region when "single_open_meta" used' do
      @view.single_open_meta(:region => 'some-region')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should display default region' do
      @view.global_open_meta(:site => 'someSite', :region => 'some-region').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should use custom region if given' do
      @view.region('some-region')
      @view.global_open_meta(:site => 'someSite', :region => 'some-region').should include('<meta content="some-region" property="og:region" />')
    end
  end
  
  # # postal_code
  context 'displaying postal_code' do
    it 'should display postal_code when "postal_code" used' do
      @view.postal_code('some-postal_code')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should display postal_code when "single_open_meta" used' do
      @view.single_open_meta(:postal_code => 'some-postal_code')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should display default postal_code' do
      @view.global_open_meta(:site => 'someSite', :postal_code => 'some-postal_code').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should use custom postal_code if given' do
      @view.postal_code('some-postal_code')
      @view.global_open_meta(:site => 'someSite', :postal_code => 'some-postal_code').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  end
  
  # country_name
  context 'displaying country_name' do
    it 'should display country_name when "country_name" used' do
      @view.country_name('some-country_name')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should display country_name when "single_open_meta" used' do
      @view.single_open_meta(:country_name => 'some-country_name')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should display default country_name' do
      @view.global_open_meta(:site => 'someSite', :country_name => 'some-country_name').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should use custom country_name if given' do
      @view.country_name('some-country_name')
      @view.global_open_meta(:site => 'someSite', :country_name => 'some-country_name').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  end
  
  # email
  context 'displaying email' do
    it 'should display email when "email" used' do
      @view.email('some-email')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should display email when "single_open_meta" used' do
      @view.single_open_meta(:email => 'some-email')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should display default email' do
      @view.global_open_meta(:site => 'someSite', :email => 'some-email').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should use custom email if given' do
      @view.email('some-email')
      @view.global_open_meta(:site => 'someSite', :email => 'some-email').should include('<meta content="some-email" property="og:email" />')
    end
  end
  
  # phone_number
  context 'displaying phone_number' do
    it 'should display phone_number when "phone_number" used' do
      @view.phone_number('some-phone_number')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should display phone_number when "single_open_meta" used' do
      @view.single_open_meta(:phone_number => 'some-phone_number')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should display default phone_number' do
      @view.global_open_meta(:site => 'someSite', :phone_number => 'some-phone_number').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should use custom phone_number if given' do
      @view.phone_number('some-phone_number')
      @view.global_open_meta(:site => 'someSite', :phone_number => 'some-phone_number').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end
  end
  
  # fax_number
  context 'displaying fax_number' do
    it 'should display fax_number when "fax_number" used' do
      @view.fax_number('some-fax_number')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should display fax_number when "single_open_meta" used' do
      @view.single_open_meta(:fax_number => 'some-fax_number')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should display default fax_number' do
      @view.global_open_meta(:site => 'someSite', :fax_number => 'some-fax_number').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should use custom fax_number if given' do
      @view.fax_number('some-fax_number')
      @view.global_open_meta(:site => 'someSite', :fax_number => 'some-fax_number').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end
  end
  
  # upc
  context 'displaying upc' do
    it 'should display upc when "upc" used' do
      @view.upc('some-upc')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-upc" property="og:upc" />')
    end

    it 'should display upc when "single_open_meta" used' do
      @view.single_open_meta(:upc => 'some-upc')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-upc" property="og:upc" />')
    end

    it 'should display default upc' do
      @view.global_open_meta(:site => 'someSite', :upc => 'some-upc').should include('<meta content="some-upc" property="og:upc" />')
    end

    it 'should use custom upc if given' do
      @view.upc('some-upc')
      @view.global_open_meta(:site => 'someSite', :upc => 'some-upc').should include('<meta content="some-upc" property="og:upc" />')
    end
  end
  
  # isbn
  context 'displaying isbn' do
    it 'should display isbn when "isbn" used' do
      @view.isbn('some-isbn')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-isbn" property="og:isbn" />')
    end

    it 'should display isbn when "single_open_meta" used' do
      @view.single_open_meta(:isbn => 'some-isbn')
      @view.global_open_meta(:site => 'someSite').should include('<meta content="some-isbn" property="og:isbn" />')
    end

    it 'should display default isbn' do
      @view.global_open_meta(:site => 'someSite', :isbn => 'some-isbn').should include('<meta content="some-isbn" property="og:isbn" />')
    end

    it 'should use custom isbn if given' do
      @view.isbn('some-isbn')
      @view.global_open_meta(:site => 'someSite', :isbn => 'some-isbn').should include('<meta content="some-isbn" property="og:isbn" />')
    end
  end

end