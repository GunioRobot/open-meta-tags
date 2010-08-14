module OpenMeta
  # Methods to use in views and helpers.
  module ViewHelper

    def set_open_meta(open_meta = {})
      @open_meta ||= {}
      @open_meta.merge!(open_meta || {})
    end
    
    def title(title, headline = '')
      set_open_meta(:title => title)
      headline.blank? ? title : headline
    end
    
    def description(description)
      set_open_meta(:description => description)
      description
    end
    
    def app_id(app_id)
      set_open_meta(:app_id => app_id)
      app_id
    end
    
    def street_address(street_address)
      set_open_meta(:street_address => street_address)
      street_address
    end
    
    def postal_code(postal_code)
      set_open_meta(:postal_code => postal_code)
      postal_code
    end
    
    def country_name(country_name)
      set_open_meta(:country_name => country_name)
      country_name
    end
    
    # metaprogramming
    def self.meta_methods(*attribute_names)
      attribute_names.each do |attribute_name|
        define_method(attribute_name) do |value|
          set_open_meta(attribute_name => value)
          value
        end
      end
    end

    meta_methods :type, :url, :image, :site_name, :latitude, :longitude, :locality, :region, :email, :phone_number, :fax_number

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
      
      description = normalize_description(open_meta[:description])
      result << tag(:meta, :property => 'og:description', :content => description) unless description.blank?
      
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