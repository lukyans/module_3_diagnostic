class Station 

attr_reader :zipcode

  def initialize(attr = {})
    @zipcode = attr["zipcode"]
  end

  def self.find_by(api_key = {})
    StationService.find_station(api_key).map do |raw_station|
      new(raw_station)
    end
  end
end
