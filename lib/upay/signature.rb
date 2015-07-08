module Upay  
  class Signature
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
    end

    def transaction_reference; @transaction_reference end
    def transaction_reference=(transaction_reference = nil) @transaction_reference = transaction_reference; end

    def transaction_value; @transaction_value end
    def transaction_value=(transaction_value = nil) @transaction_value = transaction_value; end

    def currency; @currency end
    def currency=(currency = nil) @currency = currency; end

    def signature
      @signature ||= "#{Upay.api_key}~#{Upay.merchant_id}~#{self.transaction_reference}~#{self.transaction_value}~#{self.currency}"
    end

    def signature_digest
      Digest::MD5.hexdigest(self.signature)
    end
  end
end