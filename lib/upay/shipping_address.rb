module Upay
  class ShippingAddress
    def stree1; @stree1 end
    def stree1(stree1 = nil) @stree1 = stree1; end
    
    def street2; @street2 end
    def street2(street2 = nil) @street2 = street2; end

    def city; @city end
    def city(city = nil) @city = city; end

    def state; @state end
    def state(state = nil) @state = state; end

    def country; @country end
    def country(country = nil) @country = country; end

    def postalCode; @postalCode end
    def postalCode(postalCode = nil) @postalCode = postalCode; end

    def phone; @phone end
    def phone(phone = nil) @phone = phone; end
  end
end