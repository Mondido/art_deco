require 'spec_helper'
require 'fixtures/fixtures'

describe ArtDeco do

  before(:each) do
    dummy = Dummy.new
    @decorator = DummyDecorator.new(dummy)
  end

  it 'exposes components methods' do
    expect( @decorator.get_data ).to eq('data')
  end

  it 'adds decorator methods' do
    expect( @decorator.get_additional_data ).to eq('additional data')
  end

  it 'overrides components methods' do
    expect( @decorator.shared_method ).to eq('overridden')
  end
end