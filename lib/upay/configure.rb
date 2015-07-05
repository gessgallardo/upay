module Upay  
  class Configure
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
      setup!
    end

    private 

    def setup!
      if Rails
        payu_yml = Rails.root.join('config', 'u_pay.yml')
        payu_config = YAML.load_file(payu_yml)[Rails.env]

        #configuration

        Upay.api_login = payu_config["api_login"]
        Upay.api_key = payu_config["api_key"]
        Upay.test = payu_config["test"]
        Upay.lang = payu_config["lang"]
        Upay.merchant_id = payu_config["merchant_id"]
        Upay.account_id = payu_config["account_id"]
      end
    end
  end
end