module Upay
  class Requestor

    def rest
      api_uri = (Upay.test) ? 'https://stg.api.payulatam.com/payments-api/' : "https://api.payulatam.com/payments-api/"
      @rest = Faraday.new(:url => api_uri, :ssl => {:verify => false},  headers: { accept: 'application/json', :"Content-Type" => 'application/json; charset=utf-8' }) do |faraday|
        faraday.response :logger
        faraday.response :json, :content_type => /\b(json|json-home)$/
        faraday.adapter  Faraday.default_adapter
      end
      @rest.basic_auth Upay.api_login, Upay.api_key
      @rest
    end

    def request(url, command, data={})
      api_uri = URI.parse("https://#{'stg.' if Upay.test}api.payulatam.com")

      http = Net::HTTP.new(api_uri.host, api_uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      data["merchant"] = {
        "apiKey" =>     Upay.api_key,
        "apiLogin" =>   Upay.api_login
      }

      data["command"] = command
      data["test"] = Upay.test || false
      data["language"] = "es" || Upay.lang

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
  end
end