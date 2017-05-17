class Station 
  def self.find_by(api_key)
    new(StationService.find_station(api_key))
  end
end
