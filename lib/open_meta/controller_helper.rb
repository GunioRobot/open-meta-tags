module OpenMeta
  #####  methods to use in controllers
  module ControllerHelper
    def self.included(base)
      base.send :include, InstanceMethods
      base.alias_method_chain :render, :open_meta
    end

    module InstanceMethods
      #####  processes instance variables and calls +render+
      def render_with_open_meta(*args, &block)
        open_meta = {}
        # Specify basic metadata information
        open_meta[:title]            = @page_title            if @page_title
        open_meta[:type]             = @page_type             if @page_type
        open_meta[:url]              = @page_url              if @page_url
        open_meta[:image]            = @page_image            if @page_image
        open_meta[:description]      = @page_description      if @page_description
        open_meta[:site_name]        = @page_site_name        if @page_site_name
        open_meta[:admins]           = @page_admins           if @page_admins
        open_meta[:app_id]           = @page_app_id           if @page_app_id
        # Specify location information
        open_meta[:latitude]         = @page_latitude         if @page_latitude 
        open_meta[:longitude]        = @page_longitude        if @page_longitude
        open_meta[:street_address]   = @page_street_address   if @page_street_address
        open_meta[:locality]         = @page_locality         if @page_locality
        open_meta[:region]           = @page_region           if @page_region
        open_meta[:postal_code]      = @page_postal_code      if @page_postal_code
        open_meta[:country_name]     = @page_country_name     if @page_country_name
        # Specify contact information
        open_meta[:email]            = @page_email            if @page_email
        open_meta[:phone_number]     = @phone_number          if @phone_number
        open_meta[:fax_number]       = @fax_number            if @fax_number
        # Specify shipping information
        open_meta[:upc]              = @upc                   if @upc
        open_meta[:isbn]             = @isbn                  if @isbn
        single_open_meta(open_meta)

        render_without_open_meta(*args, &block)
      end

      ##### set open graph metadata for the page.
      def single_open_meta(open_meta)
        @open_meta ||= {}
        @open_meta.merge!(open_meta || {})
      end

      protected :single_open_meta
    end
  end
end
