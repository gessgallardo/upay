module Upay
  class Order
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
    end

    def accountId; @accountId end
    def accountId=(accountId = nil); @accountId = Upay.account_id end
    
    def language; @language end
    def language=(language = nil); @language = Upay.lang end

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

    def shippingAddress; @shippingAddress end
    def shippingAddress=(shippingAddress = {}) @shippingAddress = shippingAddress; end

    def valid?
      validator = OrderValidator.new
      validator.valid?(self)
    end

    def to_hash
      order_hash = self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
      order_hash[:buyer] = self.buyer.to_hash if self.buyer
      order_hash[:shippingAddress] = self.shippingAddress.to_hash if self.shippingAddress
      order_hash
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