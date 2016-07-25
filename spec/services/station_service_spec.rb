require 'rails_helper'

describe StationService do
  use_vcr_cassette "stations"

  it "has a base connection" do
    ss = StationService.new
    url = ss.conn.url_prefix.to_s
    api_key = ss.conn.params["api_key"]

    expect(url).to eq "http://developer.nrel.gov/"
    expect(api_key).to eq ENV["nrel"]
  end

  it "can find stations by zip code" do
    ss = StationService.new
    result = ss.find_stations(zip: "80203")
    byebug
  end
end
