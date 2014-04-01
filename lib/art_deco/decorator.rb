module ArtDeco
  class Decorator
    attr_reader :component

    def initialize(component)
      self.instance_variable_set "@#{component.class.name.downcase}".to_sym, component
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
        @component.send(method_name, *args)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @component.respond_to?(method_name)
    end

    def self.factory(component)
      begin
        "#{component.class.name}Decorator".constantize.new(component)
      rescue
        ArtDeco::Decorator.new(component)
      end
    end

    def self.method_missing(method_name, *args, &block)
      if self.constant_name.constantize.respond_to?(method_name)
        self.constant_name.constantize.send(method_name, *args, &block)
      else
        super
      end
    end

    def self.respond_to_missing?(method_name, include_private = false)
      self.constant_name.constantize.respond_to?(method_name)
    end

    private

    def self.constant_name
      name = self.name.gsub(/Decorator\z/, '')
      name = 'Decorator' if name.length.zero?
      return name
    end


  end
end