module OpenMeta
  # Methods to use in views and helpers.
  module ViewHelper

    def set_open_meta(open_meta = {})
      @open_meta ||= {}
      @open_meta.merge!(open_meta || {})
    end
    
    ##### basic metadata information

    def title(title, headline = '')
      set_open_meta(:title => title)
      headline.blank? ? title : headline
    end
    
    def type(type)
      set_open_meta(:type => type)
      type
    end
    
    def url(url)
      set_open_meta(:url => url)
      url
    end
    
    def image(image)
      set_open_meta(:image => image)
      image
    end

    def description(description)
      set_open_meta(:description => description)
      description
    end
    
    def site_name(site_name)
      set_open_meta(:site_name => site_name)
      site_name
    end
    
    def app_id(app_id)
      set_open_meta(:app_id => app_id)
      app_id
    end
    
    ##### location information
    
    def latitude(latitude)
      set_open_meta(:latitude => latitude)
      latitude
    end
    
    def longitude(longitude)
      set_open_meta(:longitude => longitude)
      longitude
    end
    
    def street_address(street_address)
      set_open_meta(:street_address => street_address)
      street_address
    end
    
    def locality(locality)
      set_open_meta(:locality => locality)
      locality
    end
    
    def region(region)
      set_open_meta(:region => region)
      region
    end
    
    def postal_code(postal_code)
      set_open_meta(:postal_code => postal_code)
      postal_code
    end
    
    def country_name(country_name)
      set_open_meta(:country_name => country_name)
      country_name
    end
    
    ##### contact information

    def email(email)
      set_open_meta(:email => email)
      email
    end
    
    def phone_number(phone_number)
      set_open_meta(:phone_number => phone_number)
      phone_number
    end
    
    def fax_number(fax_number)
      set_open_meta(:fax_number => fax_number)
      fax_number
    end

    #####  set default metadata values and display metadata
    
    def display_open_meta(default = {})
      open_meta = (default || {}).merge(@open_meta || {})

      # prefix (leading space)
      prefix = open_meta[:prefix] === false ? '' : (open_meta[:prefix] || ' ')

      # separator
      separator = open_meta[:separator].blank? ? '|' : open_meta[:separator]

      # suffix (trailing space)
      suffix = open_meta[:suffix] === false ? '' : (open_meta[:suffix] || ' ')

      # title
      title = open_meta[:meta]
      if open_meta[:lowercase] === true and !title.blank?
        title = if title.is_a?(Array)
          title.map { |t| t.downcase }
        else
          title.downcase
        end
      end

      result = []

      ##### basic metadata information

      # title
      if title.blank?
        result << tag(:meta, :property => 'og:title', :content => open_meta[:site])
      else
        title = normalize_title(title)
        title = [open_meta[:site]] + title
        title.reverse! if open_meta[:reverse] === true
        sep = prefix + separator + suffix
        result << tag(:meta, :property => 'og:title', :content => title.join(sep))
      end

      # type
      type = open_meta[:type]
      result << tag(:meta, :property => 'og:type', :content => type) unless type.blank?

      # url
      url = open_meta[:url]
      result << tag(:meta, :property => 'og:url', :content => url) unless url.blank?

      # image
      image = open_meta[:image]
      result << tag(:meta, :property => 'og:image', :content => image) unless image.blank?

      # description
      description = normalize_description(open_meta[:description])
      result << tag(:meta, :property => 'og:description', :content => description) unless description.blank?

      # site_name
      site_name = open_meta[:site_name]
      result << tag(:meta, :property => 'og:site_name', :content => site_name) unless site_name.blank?

      # app_id
      app_id = open_meta[:app_id]
      result << tag(:meta, :property => 'fb:app_id', :content => app_id) unless app_id.blank?

      ##### location information

      # latitude
      latitude = open_meta[:latitude]
      result << tag(:meta, :property => 'og:latitude', :content => latitude) unless latitude.blank?

      # longitude
      longitude = open_meta[:longitude]
      result << tag(:meta, :property => 'og:longitude', :content => longitude) unless longitude.blank?

      # street address
      street_address = open_meta[:street_address]
      result << tag(:meta, :property => 'og:street-address', :content => street_address) unless street_address.blank?

      # locality
      locality = open_meta[:locality]
      result << tag(:meta, :property => 'og:locality', :content => locality) unless locality.blank?

      # region
      region = open_meta[:region]
      result << tag(:meta, :property => 'og:region', :content => region) unless region.blank?

      # postal code
      postal_code = open_meta[:postal_code]
      result << tag(:meta, :property => 'og:postal-code', :content => postal_code) unless postal_code.blank?

      # country name
      country_name = open_meta[:country_name]
      result << tag(:meta, :property => 'og:country-name', :content => country_name) unless country_name.blank?

      ##### contact information

      # email
      email = open_meta[:email]
      result << tag(:meta, :property => 'og:email', :content => email) unless email.blank?

      # phone number
      phone_number = open_meta[:phone_number]
      result << tag(:meta, :property => 'og:phone_number', :content => phone_number) unless phone_number.blank?

      # fax number
      fax_number = open_meta[:fax_number]
      result << tag(:meta, :property => 'og:fax_number', :content => fax_number) unless fax_number.blank?
      
      result = result.join("\n")
      result.respond_to?(:html_safe) ? result.html_safe : result
    end

    private

      def normalize_title(title)
        if title.is_a? String
          title = [title]
        end
        title.map { |t| h(strip_tags(t)) }
      end

      def normalize_description(description)
        return '' unless description
        truncate(strip_tags(description).gsub(/\s+/, ' '), :length => 150)
      end
  end
end