require 'thor'

module RTop
  class Runner < Thor
    map "-v" => :version
  
    desc "version", "Show RTop version"
    def version
      require 'rtop/version'
      say "RTop #{RTop::VERSION}"
    end
    
    desc "generate", "Generate configuration file for rtop"
    method_options :path => :string, :optional => true
    def generate
      require 'rtop/generators/config'
      RTop::Generators::Config.start(options[:path])
    end
  
  end
end