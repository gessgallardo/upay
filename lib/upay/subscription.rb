module Upay
  class Subscription
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def id; @id end
    def id=(id);
      @id = id
    end

    def plan; @plan end
    def plan=(plan);
      @plan = plan
    end

    def customer; @customer end
    def customer=(customer);
      @customer = customer
    end

    def trialDays; @trialDays end
    def trialDays=(trialDays);
      @trialDays = trialDays
    end

    def quantity; @quantity end
    def quantity=(quantity);
      @quantity = quantity
    end

    def installments; @installments end
    def installments=(installments);
      @installments = installments
    end

    def currentPeriodStart; @currentPeriodStart end
    def currentPeriodStart=(currentPeriodStart);
      @currentPeriodStart = currentPeriodStart
    end

    def currentPeriodEnd; @currentPeriodEnd end
    def currentPeriodEnd=(currentPeriodEnd);
      @currentPeriodEnd = currentPeriodEnd
    end

    def creditCardToken; @creditCardToken end
    def creditCardToken=(creditCardToken);
      @creditCardToken = creditCardToken
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def create
      url = "rest/v4.3/subscriptions/"
      hash_for_create = self.to_hash
      response = Requestor.new.post(url, hash_for_create)
      puts response
      self.id = response["id"]
      self
    end

    #Verb: UPDATE
    #Description:
    #Returns: JSON
    def update
      url = "/rest/v4.3/subscriptions/{self.id}"
      Requestor.new.put(url, hash_for_create)
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def show
      url = "rest/v4.3/subscriptions/#{self.id}"
      Requestor.new.get(url, {})
    end

    #Verb: DELETE
    #Description:
    #Returns: JSON
    def delete
      url = "rest/v4.3/subscriptions/#{self.id}"
      Requestor.new.delete(url, {})
    end

    def to_hash
      self.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var)}
    end
  end
end