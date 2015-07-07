module Upay
  module Address
    class ShippingAddress < Address
      def valid?
        validator = ShippingAddressValidator.new
        validator.valid?(self) 
      end
    end

    class ShippingAddressValidator < AddressValidator
    end
  end
end