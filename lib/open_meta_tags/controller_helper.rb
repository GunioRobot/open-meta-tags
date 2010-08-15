module OpenMetaTags
  #####  methods to use in controllers
  module ControllerHelper
    def self.included(base)
      base.send :include, InstanceMethods
      base.alias_method_chain :render, :open_meta_tags
    end

    module InstanceMethods
      #####  processes instance variables and calls +render+
      def render_with_open_meta_tags(*args, &block)
        open_meta_tags = {}
        # Specify basic metadata information
        open_meta_tags[:title]            = @page_title            if @page_title
        open_meta_tags[:type]             = @page_type             if @page_type
        open_meta_tags[:url]              = @page_url              if @page_url
        open_meta_tags[:image]            = @page_image            if @page_image
        open_meta_tags[:description]      = @page_description      if @page_description
        open_meta_tags[:site_name]        = @page_site_name        if @page_site_name
        open_meta_tags[:admins]           = @page_admins           if @page_admins
        open_meta_tags[:app_id]           = @page_app_id           if @page_app_id
        # Specify location information
        open_meta_tags[:latitude]         = @page_latitude         if @page_latitude 
        open_meta_tags[:longitude]        = @page_longitude        if @page_longitude
        open_meta_tags[:street_address]   = @page_street_address   if @page_street_address
        open_meta_tags[:locality]         = @page_locality         if @page_locality
        open_meta_tags[:region]           = @page_region           if @page_region
        open_meta_tags[:postal_code]      = @page_postal_code      if @page_postal_code
        open_meta_tags[:country_name]     = @page_country_name     if @page_country_name
        # Specify contact information
        open_meta_tags[:email]            = @page_email            if @page_email
        open_meta_tags[:phone_number]     = @phone_number          if @phone_number
        open_meta_tags[:fax_number]       = @fax_number            if @fax_number
        # Specify shipping information
        open_meta_tags[:upc]              = @upc                   if @upc
        open_meta_tags[:isbn]             = @isbn                  if @isbn
        single_meta_tags(open_meta_tags)

        render_without_open_meta_tags(*args, &block)
      end

      ##### set open graph metadata for single page
      def single_meta_tags(open_meta_tags)
        @open_meta_tags ||= {}
        @open_meta_tags.merge!(open_meta_tags || {})
      end

      protected :single_meta_tags
    end
  end
end
