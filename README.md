# ArtDeco

Implements the decorator design pattern by wrapping your models and adding decorative methods.

## Installation

Add this line to your application's Gemfile:

    gem 'art_deco'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install art_deco

## Usage

To create a decorator for your User model, create a file `app/decorators/user_decorator.rb`

Then declare the class UserDecorator and let it inherit from ArtDeco::Decorator

    class UserDecorator < ArtDeco::Decorator
    end

Now you can wrap your model in the decorator to add functionality without breaking the single responsibility pattern.

    user = User.find(params[:id])
    @user = UserDecorator.new(user)

## Contributing

1. Fork it ( http://github.com/robertfalken/art_deco/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
