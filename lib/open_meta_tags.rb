require 'action_controller'
require 'action_view'

module OpenMetaTags
  autoload :ViewHelper,       'open_meta_tags/view_helper'
  autoload :ControllerHelper, 'open_meta_tags/controller_helper'
end

ActionView::Base.send :include, OpenMetaTags::ViewHelper
ActionController::Base.send :include, OpenMetaTags::ControllerHelper