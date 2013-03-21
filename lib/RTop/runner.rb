require 'thor'
require 'rtop/version'
require 'rtop/generators/config.rb'

class RTop::Runner < Thor
    map "-v" => :version
  
    desc "version", "Show RTop version"
    def version      
      say "RTop #{RTop::VERSION}"
    end
    
    desc "generate", "Generate configuration file for rtop"
    method_options :path => :string, :optional => true
    def generate
      RTop::Generators::Config.start([options[:path]])
    end

end