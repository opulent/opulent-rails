# @Opulent
module Opulent
  # @Rails
  module Rails
    # @Engine
    class Engine < ::Rails::Engine
    end

    # @Railtie
    class Railtie < ::Rails::Railtie
      config.app_generators.template_engine :opulent

      initializer 'opulent_rails.configure_template_digestor' do
        # Configure cache digests to parse opulent view templates
        # when calculating cache keys for view fragments

        ActiveSupport.on_load(:action_view) do
          ActiveSupport.on_load(:after_initialize) do
            begin
              if defined?(CacheDigests::DependencyTracker)
                # 'cache_digests' gem being used (overrides Rails 4 implementation)
                CacheDigests::DependencyTracker.register_tracker :op, CacheDigests::DependencyTracker::ERBTracker

                if ::Rails.env.development?
                  # recalculate cache digest keys for each request
                  CacheDigests::TemplateDigestor.cache = ActiveSupport::Cache::NullStore.new
                end
              else
                # will only apply if Rails 4, which includes 'action_view/dependency_tracker'
                require 'action_view/dependency_tracker'
                ActionView::DependencyTracker.register_tracker :op, ActionView::DependencyTracker::ERBTracker
                ActionView::Base.cache_template_loading = false if ::Rails.env.development?
              end
            rescue
              # This version of Rails doesn't support dependency tracking
              # so, we can't parse opulent templates without 'cache_digests' gem anyway
            end
          end
        end
      end

      # Configure source annotation on opulent files
      initializer 'opulent_rails.configure_source_annotation' do
        SourceAnnotationExtractor::Annotation.register_extensions('opulent') do |tag|
          /\s*-#\s*(#{tag}):?\s*(.*)/
        end
      end
    end
  end
end
