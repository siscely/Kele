## Descripton
## Kele
Build Kele, a Ruby Gem API client to access the Bloc API.

## Initialize and Authorize Kele
As a user, I want to initialize and authorize Kele with a Bloc username and password

### Creating the Kele Gem
Create an empty repository on GitHub named Kele and clone it locally.

Creating this project as a RubyGem allows us to integrate Kele with other software.

At a minimum, a RubyGem needs a .gemspec file (typically project_name.gemspec) and one Ruby file (typically lib/project_name.rb).

A gemspec defines metadata about your RubyGem like its name, version, and author.

Create kele.gemspec:
```
 Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2015-12-02'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Hannah McExample']
   s.email         = 'hannah@example.com'
   s.files         = ['lib/kele.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end
 ```
Replace date, authors, and email with your own information.

files is an array of files included in the gem. List them individually as you create them:

s.files = ['lib/kele.rb', 'lib/roadmap.rb']`

### Create kele.rb:
```
$ md lib
$ touch lib/kele.rb
```
We place the code for a gem within the lib directory. Gem conventions are to have one Ruby file with the same name as the gem (in this case kele.rb), which gets loaded when we call require './lib/kele'.

Initialization
With the skeleton of Kele created, add an initialize method that creates a new Kele client authorized with a username and password. The client can be used as follows:
```
$ irb
>> require './lib/kele'
=> true
>> Kele.new("jane@gmail.com", "abc123")
```
In initialize, populate two instance variables:

Bloc's base API URL: https://www.bloc.io/api/v1
The user's authentication token, which can be retrieved from the sessions endpoint.
To retrieve the authentication token include HTTParty in Kele, use self.class.post, and pass in the sessions URL along with username and password. See the HTTParty repository for examples.

### Test Your Code
Test initializing Kele in IRB to ensure that:

1.  You retrieve and store the authentication token when passing valid credentials
1.  An appropriate error is raised when passing invalid credentials

