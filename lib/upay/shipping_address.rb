module Upay
  class ShippingAddress
    def street1; @street1 end
    def street1=(street1 = nil) @street1 = street1; end
    
    def street2; @street2 end
    def street2=(street2 = nil) @street2 = street2; end

    def city; @city end
    def city=(city = nil) @city = city; end

    def state; @state end
    def state=(state = nil) @state = state; end

    def country; @country end
    def country=(country = nil) @country = country; end

    def postalCode; @postalCode end
    def postalCode=(postalCode = nil) @postalCode = postalCode; end

    def phone; @phone end
    def phone=(phone = nil) @phone = phone; end

    def valid?
      validator = ShippingAddressValidator.new
      validator.valid?(self) 
    end

  end

  class ShippingAddressValidator
    include Veto.validator

    validates :street1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :postalCode, presence: true
    validates :phone, presence: true
  end
end