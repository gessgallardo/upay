module Upay
  class CreditCard
    def creditCardId; @creditCardId end
    def creditCardId=(creditCardId);
      @creditCardId = creditCardId
    end

    def name; @name end
    def name=(name);
      @name=name;
    end

    def document; @document end
    def document=(document);
      @document = document
    end

    def number; @number end
    def number=(number);
      @number = number
    end

    def expMonth; @expMonth end
    def expMonth=(expMonth);
      @expMonth = expMonth
    end

    def expYear; @expYear end
    def expYear=(expYear);
      @expYear = expYear
    end
    
    def type; @type end
    def type=(type);
      @type = type
    end

    def address; @address end
    def address=(address);
      @address = address
    end

    def initialize(attributes = {})
    end

    def valid?
      validator = CreditCardValidator.new
      validator.valid?(self) 
    end

    def create(customerID)
      url = "rest/v4.3/customers/#{customerID}/creditCards"
      data = {
        :type => self.type, 
        :expMonth => self.expMonth, 
        :expYear => self.expYear, 
        :name => self.name,
        :number => self.number
      }
      request = Requestor.new.post(url, data)
      self.creditCardId = request["token"]
    end

    def update
      url = "rest/v4.3/creditCards/#{self.creditCardId}"
      data = {
        :type => self.type, 
        :expMonth => self.expMonth, 
        :expYear => self.expYear, 
        :name => self.name,
        :number => self.number
      }
      Requestor.new.put(url, data)
    end

    def show
      begin
        unless self.creditCardId.nil?
          url = "rest/v4.3/creditCards/#{self.creditCardId}"
          Requestor.new.get(url, {:creditCardId => self.creditCardId})
        else
          raise "creditCardId cannot be blank"
        end
      end
    end

    def all
      url = "rest/v4.3/creditCards/"
      Requestor.new.get(url, {:creditCardId => ""})
    end

    def delete(customerID, creditCardId)
      url = "rest/v4.3/customers/#{customerID}/creditCards/#{creditCardId}"
      Requestor.new.delete(url, {})
    end
  end

  class CreditCardValidator
    include Veto.validator

    validates :name, presence: true
    validates :document, presence: true
    validates :number, presence: true
    validates :expMonth, presence: true
    validates :expYear, presence: true
    validates :type, presence: true
  end
end