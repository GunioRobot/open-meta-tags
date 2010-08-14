require 'action_controller'
require 'action_view'

module OpenMeta
  autoload :ViewHelper,       'open_meta/view_helper'
  autoload :ControllerHelper, 'open_meta/controller_helper'
end

ActionView::Base.send :include, OpenMeta::ViewHelper
ActionController::Base.send :include, OpenMeta::ControllerHelper