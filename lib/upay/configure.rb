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
      payu_yml = Rails.root.join('config', 'u_pay.yml')
      payu_config = YAML.load_file(payu_yml)[Rails.env]

      #configuration

      UPay.api_login = payu_config["api_login"]
      UPay.api_key = payu_config["api_key"]
      UPay.test = payu_config["test"]
      UPay.lang = payu_config["lang"]
      UPay.merchant_id = payu_config["merchant_id"]
      UPay.account_id = payu_config["account_id"]
    end
  end
end