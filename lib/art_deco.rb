require 'art_deco/version'
require 'art_deco/decorator'
require 'art_deco/behaviour'


module ArtDeco

  class ViewContext
    def self.current=(context)
      @@current = context
    end

    cattr_reader :current if self.respond_to? :cattr_reader
  end


end

