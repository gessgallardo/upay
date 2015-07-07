module Upay
  module People
    class Buyer < Person
      
      def id; @id end
      def id=(id = nil) @id = id; end

      def merchantBuyerId; @merchantBuyerId || @id end
      def merchantBuyerId=(merchantBuyerId = nil) @merchantBuyerId = merchantBuyerId; end

      def dniNumber; @dniNumber end
      def dniNumber=(dniNumber = nil) @dniNumber = dniNumber; end

      def valid?
        validator = BuyerValidator.new
        validator.valid?(self)
      end

    end

    class BuyerValidator < PersonValidator
    end
  end
end