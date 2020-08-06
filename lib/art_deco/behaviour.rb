module ArtDeco
  module Behaviour
    def self.included(base)
      base.before_action do |controller|
        ArtDeco::ViewContext.current = controller.view_context
      end
    end

    def decorate(component)
      ArtDeco::Decorator.factory(component)
    end
  end
end