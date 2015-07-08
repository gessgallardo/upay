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

    def capture_and_authorize
      payload = {}
      payload["transaction"] = self.to_hash
      response = Payment.new.submit_transaction(payload)["response"] || {code: "ERROR", error: "something went terribly wrong"}

      if response["code"] == "SUCCESS"
        transaction_response_hash = response["transactionResponse"] || {}
        transaction_response = TransactionResponse.new(transaction_response_hash)
      else
        raise response.to_json.inspect
      end
      transaction_response
    end    

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

  class TransactionResponse
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
      end
    end

    def orderId; @orderId end
    def orderId=(orderId=nil) @orderId = orderId; end

    def transactionId; @transactionId end
    def transactionId=(transactionId=nil) @transactionId = transactionId; end

    def paymentNetworkResponseCode; @paymentNetworkResponseCode end
    def paymentNetworkResponseCode=(paymentNetworkResponseCode=nil) @paymentNetworkResponseCode = paymentNetworkResponseCode; end

    def paymentNetworkResponseErrorMessage; @paymentNetworkResponseErrorMessage end
    def paymentNetworkResponseErrorMessage=(paymentNetworkResponseErrorMessage=nil) @paymentNetworkResponseErrorMessage = paymentNetworkResponseErrorMessage; end

    def trazabilityCode; @trazabilityCode end
    def trazabilityCode=(trazabilityCode=nil) @trazabilityCode = trazabilityCode; end

    def authorizationCode; @authorizationCode end
    def authorizationCode=(authorizationCode=nil) @authorizationCode = authorizationCode; end

    def pendingReason; @pendingReason end
    def pendingReason=(pendingReason=nil) @pendingReason = pendingReason; end

    def responseCode; @responseCode end
    def responseCode=(responseCode=nil) @responseCode = responseCode; end

    def errorCode; @errorCode end
    def errorCode=(errorCode=nil) @errorCode = errorCode; end

    def responseMessage; @responseMessage end
    def responseMessage=(responseMessage=nil) @responseMessage = responseMessage; end

    def transactionDate; @transactionDate end
    def transactionDate=(transactionDate=nil) @transactionDate = transactionDate; end

    def transactionTime; @transactionTime end
    def transactionTime=(transactionTime=nil) @transactionTime = transactionTime; end

    def operationDate; @operationDate end
    def operationDate=(operationDate=nil) @operationDate = operationDate; end

    def extraParameters; @extraParameters end
    def extraParameters=(extraParameters=nil) @extraParameters = extraParameters; end

    def valid?
      #validator = TransactionValidator.new
      #validator.valid?(self)
    end

    def to_hash
      transaction_hash = self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@").to_sym] = self.instance_variable_get(var)}
    end
  end
end