class StationService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(:url => 'http://developer.nrel.gov') do |f|
      f.request  :url_encoded
      f.response :logger
      f.adapter  Faraday.default_adapter
      f.params['api_key'] = ENV['nrel']
    end
  end

  def parse(body)
    JSON.parse(body)
  end

  def find_stations(search_hash)
    response = @conn.get do |req|
      req.url '/api/alt-fuel-stations/v1'
      req.params['zip'] = search_hash[:zip]
    end

    parse(response.body)
  end
end
