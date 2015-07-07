module Upay
  module Address
    class Address
      def initialize(args = {})
        args.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end

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
        validator = AddressValidator.new
        validator.valid?(self) 
      end

      def to_hash
        self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
      end

    end

    class AddressValidator
      include Veto.validator

      validates :street1, presence: true
      validates :city, presence: true
      validates :state, presence: true
      validates :country, presence: true
      validates :postalCode, presence: true
      validates :phone, presence: true
    end
  end
end