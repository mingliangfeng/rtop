# RTop

Quick start to use Taobao Open API.

## Installation

Add this line to your application's Gemfile:

    gem 'RTop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RTop

## Usage

### Use in irb
1. check rtop version in terminal:

    > rtop -v

2. generate rtop configuration file:

    > rtop generate
   
3. go into irb, and type:

```ruby
    > require 'rtop'
    > rtop = RTop::RTop.new() # by default will use taobao.yml in current folder or ./config folder
    > item = rtop.get_item(1500022659003) # default to sandbox mode, so this item is from http://mini.tbsandbox.com/buyer/items_result.htm
    > puts item["title"]
```

### Use with rails app
Simply put configuration file to yourApp/config/ folder, and start to use:

    rtop = RTop::RTop.new()
    rtop...

### Sample of the configuration file

		defaults: &DEFAULTS
		  app_key: test
		  secret_key: test
		
		development:
		  <<: *DEFAULTS
		  env: development # will use sandbox api url
		
		test:
		  <<: *DEFAULTS
		  env: test # will use sandbox api url
		
		production:
		  <<: *DEFAULTS
		  env: production # will use production api url
		  app_key: 1122334455
		  secret_key: 23424242424234234242423423

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
