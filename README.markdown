RJab: a Ruby library for Jabbify
================================

[Jabbify][jabbify] is a simple messaging service that one can plug into their website with a few lines of Javascript. At the heart of Jabbify is a centralized, ready-to-use Comet server. 

You can [utilize their Comet service][jabbify_comet] via the Javascript API, or by creating a simple GET or POST request along with the necessary parameters. This library attempts to simplify creation of that request.

Installing the Gem
------------------

    $ sudo gem install mattpuchlerz-rjab -s http://gems.github.com
		
Utilizing the Library
---------------------

    require 'rubygems'
    require 'jabbify/comet'
	
For one-off message deliveries, you might find it easiest to use the class method:

    Jabbify::Comet.deliver(
      :api_key => 'YourApiKeyGoesHere',
      :type    => :message,
      :action  => :create,
      :name    => 'John Doe',
      :message => 'This is the message!',
      :to      => 'Jane Doe',
    )

Or you could always instantiate an instance, and deliver when you're ready:

    defaults = {
      :api_key => 'YourApiKeyGoesHere',
      :type    => :message,
      :action  => :create,
      :name    => 'The Server'
    }
    
    @comet = Jabbify::Comet.new defaults
    @comet.message = "The time is now #{ Time.now }"
    
    if @comet.deliver
      # do something
    else
      # do something else
    end



[jabbify]: 			 http://jabbify.com
[jabbify_comet]: https://jabbify.com/home/comet_service