module Upay
  class Transaction
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