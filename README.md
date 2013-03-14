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

rtop = RTop::RTop.new(File.join('config', 'taobao.yml'))
item = rtop.get_item(1500022659003)
puts item["title"]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
