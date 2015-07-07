module Upay
  module People
    class Payer < Person
      
      def id; @id end
      def id=(id = nil) @id = id; end

      def merchantPayerId; @merchantPayerId || @id end
      def merchantPayerId=(merchantPayerId = nil) @merchantPayerId = merchantPayerId; end


      def valid?
        validator = PayerValidator.new
        validator.valid?(self)
      end

    end

    class PayerValidator < PersonValidator
    end
  end
end