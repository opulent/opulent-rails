require 'opulent'
require 'rails'
require_relative 'rails/version'
require_relative 'rails/template'
require_relative 'rails/register'

ActionView::Template.register_template_handler(:op, :opulent, Opulent::RailsTemplate)
