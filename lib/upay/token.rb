module Upay  
  class Token
    def payerId; @payerId end
    def payerId=(payerId); 
      @payerId = payerId 
    end
    
    def name; @name end
    def name=(name); 
      @name = name 
    end

    def code; @code end
    def code=(code); 
      @code = code 
    end

    def error; @error end
    def error=(error); 
      @error = error 
    end

    def identificationNumber; @identificationNumber end
    def identificationNumber=(identificationNumber); 
      @identificationNumber = identificationNumber 
    end

    def paymentMethod; @paymentMethod end
    def paymentMethod=(paymentMethod); 
      @paymentMethod = paymentMethod 
    end

    def number; @number end
    def number=(number); 
      @number = number 
    end

    def expirationDate; @expirationDate end
    def expirationDate=(expirationDate); 
      @expirationDate = expirationDate 
    end
    
    def creditCardTokenId; @creditCardTokenId end
    def creditCardTokenId=(creditCardTokenId); 
      @creditCardTokenId = creditCardTokenId 
    end

    def valid?
      validator = TokenValidator.new
      validator.valid?(self) 
    end

    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def create
      data = {}
      data["creditCardToken"] = self.to_hash
      response = Requestor.new.request( PAYMENTS_API_URL, "CREATE_TOKEN", data)
      self.code = response["response"]["code"]
      self.error = response["response"]["error"]

      if response["response"]["error"].blank?
        self.creditCardTokenId = response["response"]["creditCardToken"]["creditCardTokenId"]
      end

      response
    end

    def destroy
      data = {:removeCreditCardToken => { :payerId => self.payerId, :creditCardTokenId => self.creditCardTokenId}}
      response = Requestor.new.request( PAYMENTS_API_URL, "REMOVE_TOKEN", data)
    end

    def show
      data = {:removeCreditCardInformation => { :payerId => self.payerId, :creditCardTokenId => self.creditCardTokenId}}
      response = Requestor.new.request( PAYMENTS_API_URL, "GET_TOKENS", data)
    end

    def to_hash
      self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var)}
    end
  end

  class TokenValidator
    include Veto.validator

    validates :payerId, presence: true
    validates :name, presence: true
    validates :identificationNumber, presence: true
    validates :paymentMethod, presence: true
    validates :number, presence: true
    validates :expirationDate, presence: true
    validates :code, presence: true
  end
end