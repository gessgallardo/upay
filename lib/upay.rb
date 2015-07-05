module Upay
  require "upay/version"
  require "json/add/core"
  require "uri"
  require "net/https"
  require "base64"
  require "faraday"
  require "faraday_middleware"


  PAYMENTS_API_URL = "/payments-api/4.0/service.cgi"
  REPORTS_API_URL = "/reports-api/4.0/service.cgi"

  def self.merchant_id; @merchant_id end
  def self.merchant_id=(merchant_id)
    @merchant_id = merchant_id
  end

  def self.account_id; @account_id end
  def self.account_id=(account_id)
    @account_id = account_id
  end

  def self.api_key; @api_key end
  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_login; @api_login end
  def self.api_login=(api_login)
    @api_login = api_login
  end

  def self.test; @test end
  def self.test=(test)
    @test = test
  end

  def self.lang; @lang end
  def self.lang=(lang)
    @lang = lang
  end

  require "upay/configure"
  require "upay/requestor"

  require "upay/reports"
  require "upay/payments"
  require "upay/plans"
  require "upay/token"
  require "upay/customers"
  require "upay/credit_cards"
  require "upay/subscriptions"

end
