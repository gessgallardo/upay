require "upay"

Upay.config do |c|
  c.api_login = "11959c415b33d0c"
  c.api_key = "6u39nqhq8ftd0hlvnjfs66eh8c"
  c.test = true
  c.lang = "es"
  c.merchant_id = "500238"
  c.account_id = "500538"
  c.notifyUrl = "test.localhome.com/webhook"
end

customer = Upay::Customer.new({customerId: "95b99ct2pnc"})
customer.show