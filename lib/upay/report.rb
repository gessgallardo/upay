module Upay  
  class Report
    def ping
      Requestor.new.request(REPORTS_API_URL, "PING")
    end

    def order_detail(order_id)
      payload = { "details" => { "orderId" => order_id } }
      Requestor.new.request(REPORTS_API_URL, "ORDER_DETAIL", payload)
    end

    def order_detail_by_reference_code(reference_code)
      payload = { "details" => { "referenceCode" => reference_code } }
      Requestor.new.request(REPORTS_API_URL, "ORDER_DETAIL_BY_REFERENCE_CODE", payload)
    end

    def transaction_response_detail(transaction_id)
      payload = { "details" => { "transactionId" => transaction_id } }
      Requestor.new.request(REPORTS_API_URL, "TRANSACTION_RESPONSE_DETAIL", payload)
    end
  end
end