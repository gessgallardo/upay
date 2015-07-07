require "json/add/core"
require "uri"
require "net/https"
require "base64"
require "faraday"
require "faraday_middleware"
require "veto"

require "upay/credit_card"
require "upay/customer"
require "upay/order"
require "upay/plan"
require "upay/payment"

require "upay/people/person"
require "upay/people/buyer"
require "upay/people/payer"

require "upay/requestor"
require "upay/report"
require "upay/shipping_address"
require "upay/subscription"
require "upay/token"
require "upay/transaction"
require "upay/version"



module Upay
  include Veto.validator

  PAYMENTS_API_URL = "/payments-api/4.0/service.cgi"
  REPORTS_API_URL = "/reports-api/4.0/service.cgi"

  def self.config
    yield self
  end
  
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

  def self.logger; @logger end
  def self.logger=(logger)
    @logger = logger
  end

end

