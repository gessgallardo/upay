module Upay
  module Address
    class BillingAddress < Address
      def valid?
        validator = BillingAddressValidator.new
        validator.valid?(self) 
      end
    end

    class BillingAddressValidator < AddressValidator
    end
  end
end