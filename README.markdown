## Open Meta: Integrate Web page metadata into the Facebook social graph.

* **Homepage**:     [http://intridea.com](http://intridea.com)
* **Git**:          [http://github.com/intridea/open-meta](http://github.com/intridea/open-meta)
* **Author**:       Jonathan Nelson
* **Contributors**: See Contributors section below
* **Copyright**:    2010    
* **License**:      MIT License    
* **Latest Version**: 0.3.0   
* **Release Date**: August 13th 2010

## Synopsis

Open Meta is an Open Graph tool for the Ruby programming language. It enables you to turn normal web pages into meta objects in the graph. Once pages become objects in the graph, users can establish connections to your pages as they do on Facebook Pages. The value of providing structured data through the Open Graph means that your pages will show up richly across Facebook: in user profiles, within search results and in News Feed.

## Requirements

In order to turn web pages into Open Graph objects, you'll need the following in your Rails app:

* Install the Open Meta gem
* Add Open Meta tags to your web pages
* Add the Facebook Like button to your web pages

Feature List
------------

**1.** Turn any web page into meta objects in the Open Graph

These Open Graph tags allow you to specify structured information about your web pages. The more information you provide, the more opportunities your web pages can be surfaced within Facebook today and in the future. Here's an example for a music page:
     
    <html xmlns:og="http://opengraphprotocol.org/schema/"
          xmlns:fb="http://www.facebook.com/2008/fbml">
      <head>
        <title>Day & Age (2008)</title>
        <meta property="og:title" content="Day & Age"/>
        <meta property="og:type" content="music"/>
        <meta property="og:url" content="http://www.amazon.com/Day-Age-Killers/dp/B001FWRZ46/"/>
        <meta property="og:image" content="http://ecx.images-amazon.com/images/I/61CK4wp-HTL._SL500_AA300_.jpg"/>
        <meta property="og:site_name" content="Amazon"/>
        <meta property="fb:admins" content="USER_ID"/>
        <meta property="og:description"
              content="Day & Age is the third studio album by
                       American rock band The Killers, released
                       on November 24, 2008 in the UK, Canada and
                       the US."/>
        ...
      </head>
      ...
    </html>
  
**2.** Define Open Meta tags in your controller using instance variables:

    @page_title        = 'Day & Age'
    @page_type         = 'music'
    @page_site_name    = 'Amazon'
    @page_image        = 'http://ecx.images-amazon.com/images/I/61CK4wp-HTL._SL500_AA300_.jpg'
    @page_admins       = 'USER_ID'
    @page_app_id_      = 'APP_ID'
    @page_description  = 'Day & Age is the third studio album by American rock band The Killers, released on November 24, 2008 in the UK, Canada and the US.'
  
**3.** Use Open Meta tags in your views using the following methods:

    - content_for :head do
      = title 'Day & Age'
      = type 'music'
      = description 'Day & Age is the third studio album by American rock band The Killers, released on November 24, 2008 in the UK, Canada and the US.'
 
**4.** Use Open Meta tags in your view using the post_open_meta method:

    - content_for :head do
      = single_open_meta :title => 'Day & Age', :type => 'music', :description => 'Day & Age is the third studio album by American rock band The Killers, released on November 24, 2008 in the UK, Canada and the US.'
    
## Options

You can use these options to create Open Graph objects using the `global_open_meta` or `single_open_meta` method.

### Basic metadata

* title - The title of your object as it should appear within the graph, e.g., "The Rock".
* type - The type of your object, e.g., "movie". Depending on the type you specify, other properties may also be required.
* image - An image URL which should represent your object within the graph.
* url - The canonical URL of your object that will be used as its permanent ID in the graph, e.g., "http://www.imdb.com/title/tt0117500/".
* description - A one to two sentence description of your object. Limited to 150 characters. 
* site_name - If your object is part of a larger web site, the name which should be displayed for the overall site. e.g., "IMDb".
* admins - A comma-separated list of Facebook user IDs that administer the page.
* app_id - A Facebook Platform application ID that administers the page.

### Specifying locations

The Open Graph protocol supports the ability for you to specify location information for your object. This is useful if your object is for a business or anything else with a real-world location. You can specify location via latitude and longitude, a full address, or both. The property names used are defined within the [Microformat hCard](http://microformats.org/wiki/hcard).

In order to specify latitude and longitude, include the following two properties:

* latitude - e.g., "37.33182".
* longitude - e.g., "-122.03118".

If you wish to specify a human readable address, include the following five properties:

* street-address - e.g., "1 Infinite Loop"
* locality - e.g, "Cupertino"
* region - e.g., "CA"
* postal-code e.g., "95014"
* country-name - e.g., "USA"

**This:**

    - content_for :head do
      = single_open_meta :street-address => '1 Infinite Loop', :locality => 'Cupertino', :region => 'CA', :postal_code => '95014', :country_name => 'USA'

**Produces:**

    <meta property="og:street-address" content="john@doe.com" />

    <meta property="og:locality" content="1-800-555-1234" />

    <meta property="og:region" content="1-800-555-5678" />
    
    <meta property="og:postal-code" content="1-800-555-5678" />
    
    <meta property="og:country-name" content="1-800-555-5678" />

### Specifying contact information

The Open Graph protocol supports the ability for you to specify contact information for your object. It's likely that future versions of the protocol will support extracting this information from the body of your page. In order to specify contact information, include at least one of the following three properties:

* email - e.g., "john@doe.com".
* phone_number - e.g., "1-800-555-1234".
* fax_number - e.g., "1-800-555-5678".

**This:**

    - content_for :head do
      = single_open_meta :email => 'john@doe.com', :phone_number => '1-800-555-1234', :fax_number => '1-800-555-5678'

**Produces:**

    <meta property="og:email" content="john@doe.com" />

    <meta property="og:phone-number" content="1-800-555-1234" />

    <meta property="og:fax-number" content="1-800-555-5678" />

## Object Types

In order for your object to be represented within the graph, you need to specify its type. This is done using the `:type` property:

**This:**

    - content_for :head do
      = single_open_meta :type => 'product'

**Produces:**

    <meta property="og:type" content="product" />
  
The base schema includes the following types. It's possible that social networks will choose to support only a subset of these types or create additional types based on their niche.

### Activities
* activity
* sport

### Businesses
* bar
* company
* cafe
* hotel
* restaurant

### Groups
* cause
* sports_league
* sports_team

### Organizations
* band
* government
* non_profit
* school
* university

### People
* actor
* athlete
* author
* director
* musician
* politician
* public_figure

### Places
* city
* country
* landmark
* state_province

### Products and Entertainment
* album
* book
* drink
* food
* game
* movie
* product
* song
* tv_show

For **products** which have a **UPC** code or **ISBN** number, you can specify them using the **`:upc`** and **`:isbn`** properties. These properties help to make more concrete connections between graphs.

**This:**

    - content_for :head do
      = single_open_meta :upc => '123456789012', :isbn => '90-70002-34-5'

**Produces:**

    <meta property="og:upc" content="123456789012" />
    
    <meta property="og:isbn" content="90-70002-34-5" />

### Websites
* article
* blog
* website

**This:**

    - content_for :head do
      = single_open_meta :article => 'http://mashable.com/2010/07/16/apple-free-iphone-4-cases/', :blog => 'http://mashable.com'

**Produces:**

    <meta property="og:article" content="http://mashable.com/2010/07/16/apple-free-iphone-4-cases/" />
    
    <meta property="og:blog" content="http://mashable.com" />

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Intridea. See LICENSE for details.
