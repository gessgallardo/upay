module Upay
  class Customers
    def fullName; @fullName end
    def fullName=(fullName)
      @fullName = fullName
    end

    def email; @email end
    def email=(email)
      @email = email
    end

    def customerId; @customerId end
    def customerId=(customerId)
      @customerId = customerId
    end

    def subscription; @subscription end
    def subscription=(subscription)
      @subscription = subscription
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def create
      url = "rest/v4.3/customers"
      hash_for_create = self.to_hash
      response = Requestor.new.post(url, {:fullName => self.fullName, :email => self.email})
      self.customerId = response["id"]
      self
    end

    #Verb: UPDATE
    #Description:
    #Returns: JSON
    def update
      url = "rest/v4.3/customers/#{self.customerId}"
      Requestor.new.put(url, {:fullName => self.fullName, :email => self.email})
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def show
      url = "rest/v4.3/customers/#{self.customerId}"
      Requestor.new.get(url, {})
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
        self.subscription =  UPay::Subscriptions.new({:id => response["subscriptions"].last["id"]})
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
end