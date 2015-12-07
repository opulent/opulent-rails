if defined?(ActiveSupport)
  # check for a compatible Rails version when Haml is loaded
  if (activesupport_spec = Gem.loaded_specs['activesupport'])
    if activesupport_spec.version.to_s < '3.2'
      raise Exception.new("\n\n** Opulent requires Rails 3.2 and later.\n\n")
    end
  end

  ActiveSupport.on_load(:before_initialize) do
    ActiveSupport.on_load(:action_view) do
      require "opulent"
    end
  end
end

module Opulent
  class Railtie < ::Rails::Railtie
    initializer :opulent do |app|
      require "opulent"
    end
  end
end
