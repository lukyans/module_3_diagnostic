class Station 

attr_reader :zipcode

  def initialize(attr = {})
  binding.pry
    @zipcode = attr["zipcode"]
  end

  def self.find_by(api_key)
    stations = StationService.find_station(api_key)
  end
end
