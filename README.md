# lita-twit

TODO: Add a description of the plugin.

## Installation

Add lita-twit to your Lita instance's Gemfile:

``` ruby
gem "lita-twit"
```

## Configuration
Create Twitter app:  [https://apps.twitter.com/](https://apps.twitter.com/)
``` ruby
Lita.configure do |config|
  config.handlers.twit.consumer_key = "consumer_key"
  config.handlers.twit.consumer_secret = "consumer_secret"
  config.handlers.twit.access_token = "access_token"
  config.handlers.twit.access_token_secret = "access_token_secret"
end
```
## Usage

TODO: Describe the plugin's features and how to use them.
