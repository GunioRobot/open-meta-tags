module OpenMeta
  # Methods to use in views and helpers.
  module ViewHelper

    def single_open_meta(open_meta = {})
      @open_meta ||= {}
      @open_meta.merge!(open_meta || {})
    end
    
    def description(description)
      single_open_meta(:description => description)
      description
    end
    
    def admins(admins)
      single_open_meta(:admins => admins)
      admins
    end
    
    def app_id(app_id)
      single_open_meta(:app_id => app_id)
      app_id
    end
    
    def street_address(street_address)
      single_open_meta(:street_address => street_address)
      street_address
    end
    
    def postal_code(postal_code)
      single_open_meta(:postal_code => postal_code)
      postal_code
    end
    
    def country_name(country_name)
      single_open_meta(:country_name => country_name)
      country_name
    end
    
    # metaprogramming
    def self.meta_methods(*attribute_names)
      attribute_names.each do |attribute_name|
        define_method(attribute_name) do |value|
          single_open_meta(attribute_name => value)
          value
        end
      end
    end

    meta_methods :title, :type, :url, :image, :site_name, :latitude, :longitude, :locality, :region, :email, :phone_number, :fax_number

    #####  set default metadata values and display metadata

    def group_open_meta(default = {})
      open_meta = (default || {}).merge(@open_meta || {})

      result = []

      ##### metadata options
      
      description = normalize_description(open_meta[:description])
      result << tag(:meta, :property => 'og:description', :content => description) unless description.blank?
      
      admins = normalize_admins(open_meta[:admins])
      result << tag(:meta, :property => 'fb:admins', :content => admins) unless admins.blank?
      
      app_id = open_meta[:app_id]
      result << tag(:meta, :property => 'fb:app_id', :content => app_id) unless app_id.blank?
      
      street_address = open_meta[:street_address]
      result << tag(:meta, :property => 'og:street-address', :content => street_address) unless street_address.blank?
      
      postal_code = open_meta[:postal_code]
      result << tag(:meta, :property => 'og:postal-code', :content => postal_code) unless postal_code.blank?

      country_name = open_meta[:country_name]
      result << tag(:meta, :property => 'og:country-name', :content => country_name) unless country_name.blank?
      
      # metaprogramming
      [:title, :type, :url, :image, :site_name, :latitude, :longitude, :locality, :region, :email, :phone_number, :fax_number].each do |attr|
        result << tag(:meta, :property => "og:#{attr}", :content => open_meta[attr]) unless open_meta[attr].blank?
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