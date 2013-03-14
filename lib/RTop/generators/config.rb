require 'thor/group'

module RTop
  module Generators
    class Config < Thor::Group
      include Thor::Actions
      
      def copy_config
        template "taobao.yml", File.join('config', 'taobao.yml')
      end
      
      def self.source_root
        File.dirname(__FILE__)
      end
    end
  end
end