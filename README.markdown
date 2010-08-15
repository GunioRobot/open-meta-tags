## Open Meta: Integrate your Web pages into the Facebook social graph.

**Homepage**:     [http://intridea.com](http://intridea.com)
**Git**:          [http://github.com/intridea/open-meta](http://github.com/intridea/open-meta)
**Author**:       Jonathan Nelson
**Contributors**: See Contributors section below
**Copyright**:    2010    
**License**:      MIT License    
**Latest Version**: 0.3.0   
**Release Date**: August 13th 2010

## Synopsis

Open Meta is an Open Graph tool for the Ruby programming language. It enables you to turn normal web pages into meta objects in the graph. Once pages become objects in the graph, users can establish connections to your pages as they do on Facebook Pages. The value of providing structured data through the Open Graph means that your pages will show up richly across Facebook: in user profiles, within search results and in News Feed.

## Requirements

In order to turn web pages into Open Graph objects, you'll need the following in your Rails app:

* Install the Open Meta gem
* Add Open Meta tags to your web pages
* Add the Facebook Like button to your web pages
* Modify your sitewide html tag with the following:

    <html xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml">

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

You can use these options to create Open Graph objects using group_open_meta or single_open_meta.

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
