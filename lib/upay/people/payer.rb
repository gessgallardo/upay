module Upay
  module People
    class Payer < Person
      
      def id; @id end
      def id=(id = nil) @id = id; end

      def merchantPayerId; @merchantPayerId || @id end
      def merchantPayerId=(merchantPayerId = nil) @merchantPayerId = merchantPayerId; end

      def billingAddress; @billingAddress end
      def billingAddress=(billingAddress = nil) @billingAddress = billingAddress; end

      def valid?
        validator = PayerValidator.new
        validator.valid?(self)
      end

      def to_hash
        person_hash = self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
        person_hash[:billingAddress] = self.billingAddress.to_hash if self.billingAddress
        person_hash
      end

    end

    class PayerValidator < PersonValidator
    end
  end
end