require 'thor'
require 'rtop/generators/config'

module RTop
  class Cli < Thor
    desc "rspec", "Run RSpec Testing"
    def rspec
      exec "rspec ./config --color --format=documentation spec"
    end
  end
end