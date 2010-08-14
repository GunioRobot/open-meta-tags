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
    
    it 'should respond to "set_open_meta" helper' do
      @view.should respond_to(:set_open_meta)
    end

    it 'should respond to "display_open_meta" helper' do
      @view.should respond_to(:display_open_meta)
    end
  end
  
  context 'returning values' do
    it 'should return title' do
      @view.title('some-title').should == 'some-title'
    end

    it 'should return headline if specified' do
      @view.title('some-title', 'some-headline').should == 'some-headline'
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
  end
  
  # type
  context 'displaying type' do
    it 'should display type when "type" used' do
      @view.type('some-type')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should display type when "set_open_meta" used' do
      @view.set_open_meta(:type => 'some-type')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should display default type' do
      @view.display_open_meta(:site => 'someSite', :type => 'some-type').should include('<meta content="some-type" property="og:type" />')
    end

    it 'should use custom type if given' do
      @view.type('some-TYPE')
      @view.display_open_meta(:site => 'someSite', :type => 'some-TYPE').should include('<meta content="some-TYPE" property="og:type" />')
    end
  end
  
  # url
  context 'displaying url' do
    it 'should display url when "url" used' do
      @view.url('some-url')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should display url when "set_open_meta" used' do
      @view.set_open_meta(:url => 'some-url')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should display default url' do
      @view.display_open_meta(:site => 'someSite', :url => 'some-url').should include('<meta content="some-url" property="og:url" />')
    end

    it 'should use custom url if given' do
      @view.url('some-URL')
      @view.display_open_meta(:site => 'someSite', :url => 'some-URL').should include('<meta content="some-URL" property="og:url" />')
    end
  end
  
  # image
  context 'displaying image' do
    it 'should display image when "image" used' do
      @view.image('some-image')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should display image when "set_open_meta" used' do
      @view.set_open_meta(:image => 'some-image')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should display default image' do
      @view.display_open_meta(:site => 'someSite', :image => 'some-image').should include('<meta content="some-image" property="og:image" />')
    end

    it 'should use custom image if given' do
      @view.image('some-IMAGE')
      @view.display_open_meta(:site => 'someSite', :image => 'some-IMAGE').should include('<meta content="some-IMAGE" property="og:image" />')
    end
  end
  
  # description
  context 'displaying description' do
    it 'should display description when "description" used' do
      @view.description('some-description')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should display description when "description" used' do
      @view.set_open_meta(:description => 'some-description')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should display default description' do
      @view.display_open_meta(:site => 'someSite', :description => 'some-description').should include('<meta content="some-description" property="og:description" />')
    end
    
    it 'should use custom description if given' do
      @view.description('some-DESCRIPTION')
      @view.display_open_meta(:site => 'someSite', :description => 'some-DESCRIPTION').should include('<meta content="some-DESCRIPTION" property="og:description" />')
    end
  end
  
  # site_name
  context 'displaying site_name' do
    it 'should display site_name when "site_name" used' do
      @view.site_name('some-site_name')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should display site_name when "set_open_meta" used' do
      @view.set_open_meta(:site_name => 'some-site_name')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should display default site_name' do
      @view.display_open_meta(:site => 'someSite', :site_name => 'some-site_name').should include('<meta content="some-site_name" property="og:site_name" />')
    end

    it 'should use custom site_name if given' do
      @view.site_name('some-SITE_NAME')
      @view.display_open_meta(:site => 'someSite', :site_name => 'some-SITE_NAME').should include('<meta content="some-SITE_NAME" property="og:site_name" />')
    end
  end
  
  # app_id
  context 'displaying app_id' do
    it 'should display app_id when "app_id" used' do
      @view.app_id('some-app_id')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should display app_id when "set_open_meta" used' do
      @view.set_open_meta(:app_id => 'some-app_id')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should display default app_id' do
      @view.display_open_meta(:site => 'someSite', :app_id => 'some-app_id').should include('<meta content="some-app_id" property="fb:app_id" />')
    end
  
    it 'should use custom app_id if given' do
      @view.app_id('some-APP_ID')
      @view.display_open_meta(:site => 'someSite', :app_id => 'some-APP_ID').should include('<meta content="some-APP_ID" property="fb:app_id" />')
    end
  end
  
  # latitude
  context 'displaying latitude' do
    it 'should display latitude when "latitude" used' do
      @view.latitude('some-latitude')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should display latitude when "set_open_meta" used' do
      @view.set_open_meta(:latitude => 'some-latitude')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should display default latitude' do
      @view.display_open_meta(:site => 'someSite', :latitude => 'some-latitude').should include('<meta content="some-latitude" property="og:latitude" />')
    end

    it 'should use custom latitude if given' do
      @view.latitude('some-LATITUDE')
      @view.display_open_meta(:site => 'someSite', :latitude => 'some-LATITUDE').should include('<meta content="some-LATITUDE" property="og:latitude" />')
    end
  end
  
  # longitude
  context 'displaying longitude' do
    it 'should display longitude when "longitude" used' do
      @view.longitude('some-longitude')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should display longitude when "set_open_meta" used' do
      @view.set_open_meta(:longitude => 'some-longitude')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should display default longitude' do
      @view.display_open_meta(:site => 'someSite', :longitude => 'some-longitude').should include('<meta content="some-longitude" property="og:longitude" />')
    end

    it 'should use custom longitude if given' do
      @view.longitude('some-LONGITUDE')
      @view.display_open_meta(:site => 'someSite', :longitude => 'some-LONGITUDE').should include('<meta content="some-LONGITUDE" property="og:longitude" />')
    end
  end
  
  # street address
  context 'displaying street_address' do
    it 'should display street_address when "street_address" used' do
      @view.street_address('some-street_address')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should display street_address when "set_open_meta" used' do
      @view.set_open_meta(:street_address => 'some-street_address')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should display default street_address' do
      @view.display_open_meta(:site => 'someSite', :street_address => 'some-street_address').should include('<meta content="some-street_address" property="og:street-address" />')
    end
  
    it 'should use custom street_address if given' do
      @view.street_address('some-STREET_ADDRESS')
      @view.display_open_meta(:site => 'someSite', :street_address => 'some-STREET_ADDRESS').should include('<meta content="some-STREET_ADDRESS" property="og:street-address" />')
    end
  end
  
  # locality
  context 'displaying locality' do
    it 'should display locality when "locality" used' do
      @view.locality('some-locality')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should display locality when "set_open_meta" used' do
      @view.set_open_meta(:locality => 'some-locality')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should display default locality' do
      @view.display_open_meta(:site => 'someSite', :locality => 'some-locality').should include('<meta content="some-locality" property="og:locality" />')
    end

    it 'should use custom locality if given' do
      @view.locality('some-LOCALITY')
      @view.display_open_meta(:site => 'someSite', :locality => 'some-LOCALITY').should include('<meta content="some-LOCALITY" property="og:locality" />')
    end
  end
  
  # region
  context 'displaying region' do
    it 'should display region when "region" used' do
      @view.region('some-region')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should display region when "set_open_meta" used' do
      @view.set_open_meta(:region => 'some-region')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should display default region' do
      @view.display_open_meta(:site => 'someSite', :region => 'some-region').should include('<meta content="some-region" property="og:region" />')
    end

    it 'should use custom region if given' do
      @view.region('some-REGION')
      @view.display_open_meta(:site => 'someSite', :region => 'some-REGION').should include('<meta content="some-REGION" property="og:region" />')
    end
  end
  
  # # postal_code
  context 'displaying postal_code' do
    it 'should display postal_code when "postal_code" used' do
      @view.postal_code('some-postal_code')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should display postal_code when "set_open_meta" used' do
      @view.set_open_meta(:postal_code => 'some-postal_code')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should display default postal_code' do
      @view.display_open_meta(:site => 'someSite', :postal_code => 'some-postal_code').should include('<meta content="some-postal_code" property="og:postal-code" />')
    end
  
    it 'should use custom postal_code if given' do
      @view.postal_code('some-POSTAL_CODE')
      @view.display_open_meta(:site => 'someSite', :postal_code => 'some-POSTAL_CODE').should include('<meta content="some-POSTAL_CODE" property="og:postal-code" />')
    end
  end
  
  # country_name
  context 'displaying country_name' do
    it 'should display country_name when "country_name" used' do
      @view.country_name('some-country_name')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should display country_name when "set_open_meta" used' do
      @view.set_open_meta(:country_name => 'some-country_name')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should display default country_name' do
      @view.display_open_meta(:site => 'someSite', :country_name => 'some-country_name').should include('<meta content="some-country_name" property="og:country-name" />')
    end
  
    it 'should use custom country_name if given' do
      @view.country_name('some-COUNTRY_NAME')
      @view.display_open_meta(:site => 'someSite', :country_name => 'some-COUNTRY_NAME').should include('<meta content="some-COUNTRY_NAME" property="og:country-name" />')
    end
  end
  
  # email
  context 'displaying email' do
    it 'should display email when "email" used' do
      @view.email('some-email')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should display email when "set_open_meta" used' do
      @view.set_open_meta(:email => 'some-email')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should display default email' do
      @view.display_open_meta(:site => 'someSite', :email => 'some-email').should include('<meta content="some-email" property="og:email" />')
    end

    it 'should use custom email if given' do
      @view.email('some-EMAIL')
      @view.display_open_meta(:site => 'someSite', :email => 'some-EMAIL').should include('<meta content="some-EMAIL" property="og:email" />')
    end
  end
  
  # phone_number
  context 'displaying phone_number' do
    it 'should display phone_number when "phone_number" used' do
      @view.phone_number('some-phone_number')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should display phone_number when "set_open_meta" used' do
      @view.set_open_meta(:phone_number => 'some-phone_number')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should display default phone_number' do
      @view.display_open_meta(:site => 'someSite', :phone_number => 'some-phone_number').should include('<meta content="some-phone_number" property="og:phone_number" />')
    end

    it 'should use custom phone_number if given' do
      @view.phone_number('some-PHONE_NUMBER')
      @view.display_open_meta(:site => 'someSite', :phone_number => 'some-PHONE_NUMBER').should include('<meta content="some-PHONE_NUMBER" property="og:phone_number" />')
    end
  end
  
  # fax_number
  context 'displaying fax_number' do
    it 'should display fax_number when "fax_number" used' do
      @view.fax_number('some-fax_number')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should display fax_number when "set_open_meta" used' do
      @view.set_open_meta(:fax_number => 'some-fax_number')
      @view.display_open_meta(:site => 'someSite').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should display default fax_number' do
      @view.display_open_meta(:site => 'someSite', :fax_number => 'some-fax_number').should include('<meta content="some-fax_number" property="og:fax_number" />')
    end

    it 'should use custom fax_number if given' do
      @view.fax_number('some-FAX_NUMBER')
      @view.display_open_meta(:site => 'someSite', :fax_number => 'some-FAX_NUMBER').should include('<meta content="some-FAX_NUMBER" property="og:fax_number" />')
    end
  end

end