require "date"
require "digest"
require "base64"
require "uri"
require 'httparty'
require "yaml"

module RTop
  class RTop
    include HTTParty  
    
    API_URL = 'http://gw.api.taobao.com/router/rest'
    API_URL_SANDBOX = 'http://gw.api.tbsandbox.com/router/rest'
    
    API_OPTION = { "format" => "json", "v" => "2.0", "sign_method" => "md5" }
    
    def initialize(config_file = nil)
      config_file ||= "#{Rails.root}/config/taobao.yml"
      @settings = YAML.load_file(config_file)
      @settings = (defined? Rails) ? @settings[Rails.env] : @settings["defaults"]
    end
    
    def get_item(item_id)                  
      response = self.get("taobao.item.get", { "num_iid" => item_id,
                                  "fields" => "title,price,ems_fee,express_fee,detail_url,item_imgs,pic_url,location" })
      
      if response and response.parsed_response and response.parsed_response["item_get_response"] and response.parsed_response["item_get_response"]["item"]
        return response.parsed_response["item_get_response"]["item"]
      end
    end
    
    def get(method, options)
      options = prepare_options(method, options)
      self.class.get(api_url, :query => options)
    end
      
    def post(url, options)
      options = prepare_options(method, options)
      self.class.post(api_url, :query => options)
    end
      
    def put(url, options)
      options = prepare_options(method, options)
      self.class.put(api_url, :query => options)
    end
      
    def delete(url, options)
      options = prepare_options(method, options)
      self.class.delete(api_url, :query => options)
    end
    
    protected
      def api_url
        @settings["env"] == "production" ? API_URL : API_URL_SANDBOX
      end
      
      def md5_signature(params, secret)
        params_sorted = params.sort_by { |k,v| k.to_s }
        params_str = params_sorted.flatten.join
        params_token = "#{secret}#{params_str}#{secret}"
        Digest::MD5.hexdigest(params_token).upcase
      end
      
      def prepare_options(method, options)
        opts = { "method" => method,
                 "timestamp" => Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                 "app_key" => @settings["app_key"] }.merge(API_OPTION)
        opts = opts.merge(options || {})        
        opts.merge({"sign" => md5_signature(opts, @settings["secret_key"])})
      end
  end
end