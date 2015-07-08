require "upay"
require "faker"
require "digest"

#Configure Upay

Upay.config do |c|
  c.api_login = "11959c415b33d0c"
  c.api_key = "6u39nqhq8ftd0hlvnjfs66eh8c"
  c.test = true
  c.lang = "es"
  c.merchant_id = "500238"
  c.account_id = "500538"
  c.notifyUrl = "test.localhome.com/webhook"
end

#Setting up the transaction signature

product_description = Faker::Commerce.product_name
product_value = Faker::Number.number(5).to_i
transaction_reference = Faker::Company.duns_number

signature = Upay::Signature.new({
  transaction_reference: transaction_reference,
  transaction_value: product_value,
  currency: "COP"
})


#Creating a Customer

cus_name = Faker::Name.name
cus_email = cus_name.gsub(/[^A-Za-z0-9]/, "").downcase+"@gessgallardo.com"
cus_phone = Faker::Number.number(10)
cus_dni = Faker::Number.number(10)

customer = Upay::Customer.new({
  fullName: cus_name,
  email: cus_email
})

customer.create

#Requesting a token

token = Upay::Token.new({
  payerId: customer.customerId,
  name: "APPROVED",
  paymentMethod: "VISA",
  number: "4024007182061886",
  expirationDate: "2017/01",
  identificationNumber: "1234567890"
})

token.create

#Capture and authorize transaction

transaction = Upay::Transaction.new({
  order: Upay::Order.new({
    referenceCode: transaction_reference,
    description: product_description,
    signature: signature.signature_digest,
    additionalValues:{
      TX_VALUE:{
        value: product_value,
        currency: "COP"
      }
    },
    buyer: Upay::People::Buyer.new({
      merchantBuyerId: "1000",
      fullName: cus_name,
      emailAddress: cus_email,
      contactPhone: cus_phone,
      dniNumber: cus_dni
    }),
  }),
  payer: Upay::People::Payer.new({
    merchantPayerId: "1000",
    fullName: cus_name,
    emailAddress: cus_email
  }),
  creditCardTokenId: token.creditCardTokenId,
  type: "AUTHORIZATION_AND_CAPTURE",
  paymentMethod: "VISA",
  paymentCountry: "CO",
  deviceSessionId: Faker::Internet.password(10, 20)
})

transaction_response = transaction.capture_and_authorize