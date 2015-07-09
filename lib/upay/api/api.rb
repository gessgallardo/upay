module Upay
  class API
    def credit_card(args = {})
      CreditCard.new(args)
    end
    def customer(args = {})
      Customer.new(args)
    end
    def order(args = {})
      Order.new(args)
    end
    def payment(args = {})
      Payment.new(args)
    end
    def plan(args = {})
      Plan.new(args)
    end
    def report(args = {})
      Report.new(args)
    end
    def requestor(args = {})
      Requestor.new(args)
    end
    def signature(args = {})
      Signature.new(args)
    end
    def subscription(args = {})
      Subscription.new(args)
    end
    def token(args = {})
      Token.new(args)
    end
    def transaction(args = {})
      Transaction.new(args)
    end
  end
end