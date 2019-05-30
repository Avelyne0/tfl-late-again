class User < ActiveRecord::Base
  has_many :excuses

  # @affected_lines_array = []

  #find ids from inside the station_id table using the user inputted data

  # setter for user origin and dest
  def origin_station(name)
    @origin = Station.find_by commonName: name
  end

  def destination_station(name)
    @destination = Station.find_by commonName: name
  end


  def find_disrupted_lines
    @disruptions = "#{URL_BASE}/Line/Mode/tube/Disruption?app_key=#{APP_KEY}&app_id=#{APP_ID}"
    @disruptions_information = JSON.parse(RestClient.get(disruptions))
    @disrupted_lines = @disruptions_information.map { |disruption| disruption["description"].split(":").first}
  end

  # disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]
  # disruption_type = "#{URL_BASE}/Line/Meta/DisruptionCategories?app_key=#{APP_KEY}&app_id=#{APP_ID}"
  # disruptions_information = JSON.parse(RestClient.get(disruption_type))

  def self.find_route
    route = "#{URL_BASE}/journey/journeyresults/#{@origin.id}/to/#{@destination.id}?app_key=#{APP_KEY}&app_id=#{APP_ID}"
    route_information = JSON.parse(RestClient.get(route))
    route_lines = (route_information.select{|information| information["lines"]})["lines"].map{|lines| lines["name"]}
  end

  def affected_lines_array
    User.find_route
    find_disrupted_lines
    if @disrupted_lines == []
      @affected_lines_array = @route_lines
      # returns an array of train lines that we can lie about and say that there was a delay!
    elsif (@route_lines & @disrupted_lines) != []
      # returns an array of train lines that are ACTUALLY disrupted and that the user would actually be using.
      @affected_lines_array = (@route_lines & @disrupted_lines)
    else
      # returns the array of train lines that are disrupted and then we'll just lie that the user was staying at an assigned station on one of the affected lines
      @affected_lines_array = @disrupted_lines
    end
    binding.pry
  end

  def affected_line
    @affected_line = @affected_lines_array.sample
  end


  # binding.pry
end
