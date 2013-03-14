require 'thor'
require './lib/rtop/generators/config'

module RTop
  class Cli < Thor
    desc "rspec", "Run RSpec Testing"
    def rspec
      exec "rspec --color --format=documentation spec"
    end
  end
end