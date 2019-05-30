class User < ActiveRecord::Base
  has_many :excuses


  url_base = "https://api.tfl.gov.uk"
  app_id = "d4a1a955"
  app_key = "752dfb87ef1e3702402c660cecf36992"


  #find ids from inside the station_id table using the user inputted data

  # setter for user origin and dest
  def origin(name)
    @origin = Station.find_by commonName: name
  end

  def destination(name)
    @destination = Station.find_by commonName: name
  end

  def find_disrupted_lines
    disruptions = "#{url_base}/Line/Mode/tube/Disruption?app_key=#{app_key}&app_id=#{app_id}"
    disruptions_information = JSON.parse(RestClient.get(disruptions))
    disrupted_lines = disruptions_information.map { |disruption| disruption["description"].split(":").first}
  end

  # disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]
  # disruption_type = "#{url_base}/Line/Meta/DisruptionCategories?app_key=#{app_key}&app_id=#{app_id}"
  # disruptions_information = JSON.parse(RestClient.get(disruption_type))

  def find_route
    route = "#{url_base}/journey/journeyresults/#{@origin.id}/to/#{@destination.id}"
    route_information = JSON.parse(RestClient.get(route))
    route_lines = (route_information.select{|x| x["lines"]})["lines"].map{|x| x["name"]}
  end

  def affected_lines_array
    if disruptions_information == []
      affected_lines_array = route_lines
      # returns an array of train lines that we can lie about and say that there was a delay!
    elsif (route_lines & disrupted_lines) != []
      # returns an array of train lines that are ACTUALLY disrupted and that the user would actually be using.
      affected_lines_array = (route_lines & disrupted_lines)
    else
      # returns the array of train lines that are disrupted and then we'll just lie that the user was staying at an assigned station on one of the affected lines
      affected_lines_array = disrupted lines
    end
  end



  # binding.pry
end
