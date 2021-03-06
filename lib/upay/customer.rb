module Upay
  class Customer

    def initialize(args = {})
      reload(args)
    end

    def reload(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v)
        if k == "creditCards"
          ccs = []
          v.each do |c|
            puts c
            ccs << CreditCard.new(c)
          end
          instance_variable_set("@#{k}", ccs)
        end
      end
    end

    def fullName; @fullName end
    def fullName=(fullName)
      @fullName = fullName
    end

    def email; @email end
    def email=(email)
      @email = email
    end

    def id; @id end
    def id=(id)
      @id = id
    end

    def customerId; @customerId end
    def customerId=(customerId)
      @customerId = customerId
    end

    def subscription; @subscription end
    def subscription=(subscription)
      @subscription = subscription
    end

    def creditCards; @creditCards end
    def creditCards=(creditCards = {}) @creditCards = creditCards end

    def valid?
      validator = CustomerValidator.new
      validator.valid?(self) 
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def create
      url = "rest/v4.3/customers"
      hash_for_create = self.to_hash
      response = Requestor.new.post(url, {:fullName => self.fullName, :email => self.email})
      self.customerId = response["id"]
      self.id = response["id"]
      self
    end

    #Verb: UPDATE
    #Description:
    #Returns: JSON
    def update
      url = "rest/v4.3/customers/#{self.customerId}"
      Requestor.new.put(url, {:fullName => self.fullName, :email => self.email})
    end

    #Verb: GET
    #Description:
    #Returns: JSON
    def show
      begin
        unless self.customerId.nil?
          url = "rest/v4.3/customers/#{self.customerId}"
          response = Requestor.new.get(url, {})
          self.reload(response)
        else
          raise "customerId cannot be blank"
        end
      end
      self
    end

    #Verb: GET
    #Description:
    #Returns: JSON
    def all
      url = "rest/v4.3/customers/"
      customers = []
      list_of_customers = Requestor.new.get(url, {})
      if list_of_customers["customerList"] && list_of_customers["customerList"].count > 0
        customers = list_of_customers["customerList"].map{|x| Customer.new(x) }
      end
      customers
    end

    #Verb: DELETE
    #Description:
    #Returns: JSON
    def delete
      url = "rest/v4.3/customers/#{self.customerId}"
      Requestor.new.delete(url, {})
    end

    #Subscriptions Thingys

    def subscription
      response = self.show
      if response["subscriptions"]
        self.subscription =  Subscription.new({:id => response["subscriptions"].last["id"]})
      else
        {}
      end

    end

    def has_subscription?(planCode)
      response = self.show
      it_has = false
      unless response["subscriptions"].blank? 
        response["subscriptions"].each do |subscription|
          if subscription["plan"]["planCode"] == planCode
            it_has = true
          end
        end
      end
      it_has
    end

    def has_subscriptions?
      response = self.show
      unless response["subscriptions"].blank?
        response["subscriptions"].count > 0
      else
        false
      end
    end

    def to_hash
      {
        :customerId => self.customerId || nil,
        :fullName => self.fullName,
        :email => self.email
      }
    end
  end

  class CustomerValidator
    include Veto.validator

    validates :fullName, :presence => true
    validates :email, :presence => true
  end
end