require 'thor'

module RTop
  class Runner < Thor
    map "-v" => :version
  
    desc "version", "Show RTop version"
    def version
      require 'rtop/version'
      say "RTop #{RTop::VERSION}"
    end
  
  end
end