module OpenMetaTags
  # Methods to use in views and helpers.
  module ViewHelper

    def single_meta_tags(open_meta_tags = {})
      @open_meta_tags ||= {}
      @open_meta_tags.merge!(open_meta_tags || {})
    end
    
    def description(description)
      single_meta_tags(:description => description)
      description
    end
    
    def admins(admins)
      single_meta_tags(:admins => admins)
      admins
    end
    
    def app_id(app_id)
      single_meta_tags(:app_id => app_id)
      app_id
    end
    
    def street_address(street_address)
      single_meta_tags(:street_address => street_address)
      street_address
    end
    
    def postal_code(postal_code)
      single_meta_tags(:postal_code => postal_code)
      postal_code
    end
    
    def country_name(country_name)
      single_meta_tags(:country_name => country_name)
      country_name
    end
    
    # metaprogramming
    def self.meta_methods(*attribute_names)
      attribute_names.each do |attribute_name|
        define_method(attribute_name) do |value|
          single_meta_tags(attribute_name => value)
          value
        end
      end
    end

    meta_methods :title, :type, :url, :image, :site_name, :latitude, :longitude, :locality, :region, :email, :phone_number, :fax_number, :upc, :isbn

    #####  set default metadata values and display metadata

    def global_meta_tags(default = {})
      open_meta_tags = (default || {}).merge(@open_meta_tags || {})

      result = []

      ##### metadata options
      
      description = normalize_description(open_meta_tags[:description])
      result << tag(:meta, :property => 'og:description', :content => description) unless description.blank?
      
      admins = normalize_admins(open_meta_tags[:admins])
      result << tag(:meta, :property => 'fb:admins', :content => admins) unless admins.blank?
      
      app_id = open_meta_tags[:app_id]
      result << tag(:meta, :property => 'fb:app_id', :content => app_id) unless app_id.blank?
      
      street_address = open_meta_tags[:street_address]
      result << tag(:meta, :property => 'og:street-address', :content => street_address) unless street_address.blank?
      
      postal_code = open_meta_tags[:postal_code]
      result << tag(:meta, :property => 'og:postal-code', :content => postal_code) unless postal_code.blank?

      country_name = open_meta_tags[:country_name]
      result << tag(:meta, :property => 'og:country-name', :content => country_name) unless country_name.blank?
      
      # metaprogramming
      [:title, :type, :url, :image, :site_name, :latitude, :longitude, :locality, :region, :email, :phone_number, :fax_number, :upc, :isbn].each do |attr|
        result << tag(:meta, :property => "og:#{attr}", :content => open_meta_tags[attr]) unless open_meta_tags[attr].blank?
      end

      result = result.join("\n")
      result.respond_to?(:html_safe) ? result.html_safe : result
    end

    private

      def normalize_description(description)
        return '' unless description
        truncate(strip_tags(description).gsub(/\s+/, ' '), :length => 150)
      end
      
      def normalize_admins(admins)
        return '' unless admins
        admins = admins.flatten.join(', ') if admins.is_a?(Array)
        strip_tags(admins).mb_chars.downcase
      end
  end
end