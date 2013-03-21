require 'thor'

module RTop
  class Runner < Thor
    map "-v" => :version, "-g" => :generate
  
    desc "version", "Show RTop version"
    def version
      require 'rtop/version'
      say "RTop #{RTop::VERSION}"
    end
    
    desc "generate", "Generate configuration file for rtop"
    method_options :path => :string
    def generate
      require 'rtop/generators/config'
      RTop::Generators::Config.start(path)
    end
  
  end
end