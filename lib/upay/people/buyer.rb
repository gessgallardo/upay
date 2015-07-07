module Upay
  module People
    class Buyer < Person
      
      def id; @id end
      def id=(id = nil) @id = id; end

      def merchantBuyerId; @merchantBuyerId || @id end
      def merchantBuyerId=(merchantBuyerId = nil) @merchantBuyerId = merchantBuyerId; end

      def dniNumber; @dniNumber end
      def dniNumber=(dniNumber = nil) @dniNumber = dniNumber; end

      def shippingAddress; @shippingAddress end
      def shippingAddress=(shippingAddress = nil) @shippingAddress = shippingAddress; end

      def valid?
        validator = BuyerValidator.new
        validator.valid?(self)
      end

      def to_hash
        person_hash = self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
        person_hash[:shippingAddress] = self.shippingAddress.to_hash if self.shippingAddress
        person_hash
      end

    end

    class BuyerValidator < PersonValidator
    end
  end
end