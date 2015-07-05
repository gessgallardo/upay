module Upay
  class Plans
    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def accountId; @accountId end
    def accountId=(accountId)
      @accountId = accountId
    end

    def planCode; @planCode end
    def planCode=(planCode)
      @planCode = planCode
    end

    def description; @description end
    def description=(description)
      @description = description
    end

    def interval; @interval end
    def interval=(interval)
      @interval = interval
    end

    def value; @value end
    def value=(value)
      @value = value
    end

    def currency; @currency end
    def currency=(currency)
      @currency = currency
    end

    def intervalCount; @intervalCount end
    def intervalCount=(intervalCount)
      @intervalCount = intervalCount
    end

    def maxPaymentsAllowed; @maxPaymentsAllowed end
    def maxPaymentsAllowed=(maxPaymentsAllowed)
      @maxPaymentsAllowed = maxPaymentsAllowed
    end

    def paymentAttempsDelay; @paymentAttempsDelay end
    def paymentAttempsDelay=(paymentAttempsDelay)
      @paymentAttempsDelay = paymentAttempsDelay
    end

    def additionalValues; @additionalValues end
    def additionalValues=(additionalValues)
      @additionalValues = additionalValues
    end

    def trialDays; @trialDays end
    def trialDays=(trialDays)
      @trialDays = trialDays
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def create
      url = "rest/v4.3/plans"
      Requestor.new.post(url, self.to_hash)

    end

    #Verb: UPDATE
    #Description:
    #Returns: JSON
    def update
      url = "rest/v4.3/plans/#{self.planCode}"
      Requestor.new.put(url, self.to_hash)
    end

    #Verb: POST
    #Description:
    #Returns: JSON
    def show
      url = "rest/v4.3/plans/#{self.planCode}"
      Requestor.new.get(url, self.to_hash)
    end

    def find_by_name(name)
      url = "rest/v4.3/plans/"
      request = Requestor.new.get(url, {})
      obtained_plan = {}
      request["subscriptionPlanList"].each do |plan|
        obtained_plan = plan if plan["planCode"] == name
      end
      obtained_plan
    end

    #Verb: DELETE
    #Description:
    #Returns: JSON
    def delete
      url = "rest/v4.3/plans/#{self.planCode}"
      Requestor.new.delete(url, self.to_hash)
    end

    def to_hash
      {
        :accountId => self.accountId || nil,
        :planCode => self.planCode,
        :description => self.description,
        :interval => self.interval,
        :intervalCount => self.intervalCount,
        :maxPaymentsAllowed => self.maxPaymentsAllowed || nil,
        :paymentAttemptsDelay => "1",
        :additionalValues => [
          {
            :name => "PLAN_VALUE",
            :value => self.value,
            :currency => "COP"
          }
        ]
      }
    end
  end
end