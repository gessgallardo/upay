module Upay
  class Requestor
    def rest
      UPay::Configure.new() if UPay.api_login.blank?
      api_uri = (UPay.test) ? 'https://stg.api.payulatam.com/payments-api/' : "https://api.payulatam.com/payments-api/"
      @rest = Faraday.new(:url => api_uri, :ssl => {:verify => false},  headers: { accept: 'application/json', :"Content-Type" => 'application/json; charset=utf-8' }) do |faraday|
        faraday.response :logger
        faraday.response :json, :content_type => /\b(json|json-home)$/
        faraday.adapter  Faraday.default_adapter
      end
      @rest.basic_auth UPay.api_login, UPay.api_key
      @rest
    end

    def request(url, command, data={})
      UPay::Configure.new() if UPay.api_login.blank?

      api_uri = URI.parse("https://#{'stg.' if UPay.test}api.payulatam.com")

      http = Net::HTTP.new(api_uri.host, api_uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      data["merchant"] = {
        "apiKey" =>     UPay.api_key,
        "apiLogin" =>   UPay.api_login
      }

      data["command"] = command
      data["test"] = UPay.test || false
      data["language"] = "es" || UPay.lang

      headers = {
        "Accept" =>         "application/json",
        "Content-Type" =>   "application/json; charset=utf-8"
      }

      result = http.send_request("POST", url, data.to_json, headers)

      begin
        response = JSON.parse(result.body)
      rescue Exception => e
        response = result.body
      end

      return {
        "status" => result.code,
        "response" => response
      }
    end

    def get url, data = {}
      request = self.rest.get do |req|
        req.url "#{url}"
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json; charset=utf-8'
        req.body = data.to_json
      end
      return request.body
    end

    def post url, data = {}
      request = self.rest.post do |req|
        req.url "#{url}"
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json; charset=utf-8'
        req.body = data.to_json
      end
      return request.body
    end

    def delete url, data = {}
      request = self.rest.delete do |req|
        req.url "#{url}"
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json; charset=utf-8'
        req.body = data.to_json
      end
      return request.body
    end

    def put url, data = {}
      request = self.rest.put do |req|
        req.url "#{url}"
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json; charset=utf-8'
        req.body = data.to_json
      end
      return request.body
    end

    def scope data = {}
      api_uri = "https://payu-2jdjm8jh2t1z.runscope.net/"
      scope = Faraday.new(:url => api_uri, :ssl => {:verify => false},  headers: { accept: 'application/json', :"Content-Type" => 'application/json; charset=utf-8' }) do |faraday|
        faraday.response :json, :content_type => /\b(json|json-home)$/

        faraday.adapter  Faraday.default_adapter
      end
      request = scope.post do |req|
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json; charset=utf-8'
        req.body = data.to_json
      end
      return request.body
    end
  end
end