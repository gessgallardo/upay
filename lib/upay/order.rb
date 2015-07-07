module Upay
  class Order
    def accountId; Upay.account_id end

    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
    end

    def language; "es" end

    def notifyUrl; @notifyUrl end
    def notifyUrl=(notifyUrl = "") @notifyUrl = notifyUrl; end

    def additionalValues; @additionalValues end
    def additionalValues=(additionalValues = {}); @additionalValues end


    def referenceCode; @referenceCode end
    def referenceCode=(referenceCode = nil) @referenceCode = referenceCode; end
    
    def description; @description end
    def description=(description = nil) @description = description; end
    
    def signature; @signature end
    def signature=(signature = nil) @signature = signature; end
    
    def buyer; @buyer end
    def buyer=(buyer = {}) @buyer = buyer; end

    def valid?
      validator = OrderValidator.new
      validator.valid?(self)
    end

    def to_hash
      self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var)}
    end
  end

  class OrderValidator
    include Veto.validator

    validates :referenceCode, presence: true
    validates :description, presence: true
    validates :signature, presence: true
    validates :buyer, presence: true
  end
end