module Upay
  module People
    class Person
      def initialize(args = {})
        args.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end

      def fullName; @fullName end
      def fullName=(fullName) @fullName = fullName end

      def emailAddress; @emailAddress end
      def emailAddress=(emailAddress) @emailAddress = emailAddress end

      def contactPhone; @contactPhone end
      def contactPhone=(contactPhone) @contactPhone = contactPhone; end

      def valid?
        validator = PersonValidator.new
        validator.valid?(self)
      end
    end

    class PersonValidator
      include Veto.validator

      validates :fullName, presence: true
      validates :emailAddress, presence: true

    end
  end
end