module Upay
  class API
    def credit_card
      CreditCard.new
    end
    def customer
      Customer.new
    end
    def order
      Order.new
    end
    def payment
      Payment.new
    end
    def plan
      Plan.new
    end
    def report
      Report.new
    end
    def requestor
      Requestor.new
    end
    def signature
      Signature.new
    end
    def subscription
      Subscription.new
    end
    def token
      Token.new
    end
    def transaction
      Transaction.new
    end
  end
end