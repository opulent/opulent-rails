# @Opulent
module Opulent
  # This module makes Opulent work with Rails using the template handler API.
  class RailsTemplate
    def handles_encoding?
      true
    end

    def compile(template)
      options = {}
      if template.respond_to?(:type)
        options[:mime_type] = template.type
      elsif template.respond_to? :mime_type
        options[:mime_type] = template.mime_type
      end
      options[:filename] = template.identifier

      Opulent.new(
        template.source,
        options
      ).template
    end

    def self.call(template)
      new.compile(template)
    end

    def cache_fragment(block, name = {}, options = nil)
      @view.fragment_for(block, name, options) do
        eval '@_opulent_buffer', block.binding
      end
    end
  end
end
