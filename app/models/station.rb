class Station
  def self.service
    @@service ||= StationService.new
  end

  def self.where(search_hash)
    service.find_stations(search_hash)
  end
end
