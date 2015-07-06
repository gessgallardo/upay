module Upay
  class Payment
    def ping_payments
      Requestor.new.request(PAYMENTS_API_URL, "PING")
    end

    def get_payment_methods
      Requestor.new.request(PAYMENTS_API_URL, "GET_PAYMENT_METHODS")
    end

    def submit_transaction(payload)
      Requestor.new.request(PAYMENTS_API_URL, "SUBMIT_TRANSACTION", payload)
    end
  end
end
