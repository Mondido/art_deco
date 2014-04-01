class Dummy
  def get_data
    'data'
  end

  def shared_method
    'original'
  end
end

class DummyDecorator < ArtDeco::Decorator
  def get_additional_data
    'additional data'
  end

  def shared_method
    'overridden'
  end
end