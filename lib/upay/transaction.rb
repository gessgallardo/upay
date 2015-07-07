module Upay
  class Transaction
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
    end

    def order; @order end
    def order=(order = nil); @order = order; end
    
    def payer; @payer end
    def payer=(payer = nil); @payer = payer; end
    
    def creditCardTokenId; @creditCardTokenId end
    def creditCardTokenId=(creditCardTokenId = nil); @creditCardTokenId = creditCardTokenId; end
    
    def type; @type end
    def type=(type = nil); @type = type; end
    
    def paymentMethod; @paymentMethod end
    def paymentMethod=(paymentMethod = nil); @paymentMethod = paymentMethod; end
    
    def paymentCountry; @paymentCountry end
    def paymentCountry=(paymentCountry = nil); @paymentCountry = paymentCountry; end

    def deviceSessionId; @deviceSessionId end
    def deviceSessionId=(deviceSessionId = nil); @deviceSessionId = deviceSessionId; end

    def ipAddress; @ipAddress; end
    def ipAddress=(ipAddress = nil) @ipAddress = ipAddress end

    def cookie; @cookie end
    def cookie=(cookie = nil) @cookie = cookie end

    def userAgent; @userAgent end
    def userAgent=(userAgent = nil) @userAgent = userAgent; end

    
    def valid?
      validator = TransactionValidator.new
      validator.valid?(self)
    end

    def to_hash
      transaction_hash = self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
      transaction_hash[:order] = self.order.to_hash if self.order
      transaction_hash[:payer] = self.payer.to_hash if self.payer
      transaction_hash
    end
  end

  class TransactionValidator
    include Veto.validator

    validates :creditCardTokenId, presence: true
    validates :cookie, presence: true
    validates :deviceSessionId, presence: true
    validates :order, presence: true
    validates :payer, presence: true
    validates :paymentCountry, presence: true
    validates :paymentMethod, presence: true
    validates :type, presence: true
  end
end