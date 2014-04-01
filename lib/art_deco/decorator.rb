module ArtDeco
  class Decorator
    def initialize(component)
      @component = component
    end

    def helpers
      ViewContext.current
    end

    alias_method :h, :helpers

    def translate(*args)
      I18n.translate(*args)
    end

    def self.wrap(collection)
      collection.map{ |component| ArtDeco::Decorator.factory(component) }
    end

    alias_method :t, :translate

    def method_missing(method_name, *args, &block)
      if @component.respond_to?(method_name)
        @component.try(method_name)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @component.respond_to?(method_name)
    end

    def self.factory(component)
      "#{component.class.name}Decorator".constantize.new(component) rescue ArtDeco::Decorator.new(component)
    end

  end
end