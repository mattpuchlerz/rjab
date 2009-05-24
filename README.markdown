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
    require 'jabbify'
	
If you only make one message delivery in your app, you might find it easiest to use the class method:

    Jabbify::Comet.deliver(
      :api_key => 'YourApiKeyGoesHere',
      :type    => :type_of_delivery,
      :action  => :action_of_delivery,
      :name    => 'John Doe',
      :message => 'This is the message!',
      :to      => 'Jane Doe',
    )

More commonly, you will instantiate an instance of `Jabbify::Comet` with a few customized attributes. Then you can just call `#deliver` whenever you're ready, passing in a couple more attributes which will *only be used during the delivery*:

    custom_attributes = {
      :api_key => 'YourApiKeyGoesHere',
      :name    => 'The Server'
    }
    
    @comet = Jabbify::Comet.new(custom_attributes)
    
    if @comet.deliver(:message => "A special message at #{ Time.now.to_s }")
      # do something
    else
      # do something else
    end

Default Attributes on the `Jabbify::Comet` Class
------------------------------------------------

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Default Value</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>:action</code></td>
      <td><code>:create</code></td>
      <td>The action you are performing against the type, as a <strong>symbol</strong>. Commonly a RESTful action.</td>
    </tr>
    <tr>
      <td><code>:api_key</code></td>
      <td><code>nil</code></td>
      <td>The API key provided to you when you sign up with Jabbify.</td>
    </tr>
    <tr>
      <td><code>:message</code></td> 
      <td><code>nil</code></td>
      <td>The message to deliver to the Comet server.</td>
    </tr>
    <tr>
      <td><code>:name</code></td>
      <td><code>'Server'</code></td>
      <td>The sender of the message.</td>
    </tr>
    <tr>
      <td><code>:to</code></td>
      <td><code>nil</code></td>
      <td>The recipient of the message. Not usually specified, as most messages are sent to all users.</td>
    </tr>
    <tr>
      <td><code>:type</code></td>
      <td><code>:message</code></td>
      <td>The type of resource you are working with, as a <strong>symbol</strong>.</td>
    </tr>
  </tbody>
</table>



[jabbify]: 			 http://jabbify.com
[jabbify_comet]: https://jabbify.com/home/comet_service