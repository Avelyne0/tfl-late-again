class User < ActiveRecord::Base
  has_many :excuses

  url_base = "https://api.tfl.gov.uk"
  app_id = "d4a1a955"
  app_key = "752dfb87ef1e3702402c660cecf36992"


  #find ids from inside the station_id table using the user inputted data
  origin_id = 1000266
  destination_id = 1000013

  disruptions_call = "#{url_base}/Line/Mode/tube/Disruption?app_key=#{app_key}&app_id=#{app_id}"
  #disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]
  disruption_type = "#{url_base}/Line/Meta/DisruptionCategories?app_key=#{app_key}&app_id=#{app_id}"
  route = "#{url_base}/journey/journeyresults/#{origin_id}/to/#{destination_id}"


  disruptions_information = JSON.parse(RestClient.get(disruptions))
  route_information = JSON.parse(RestClient.get(route))



  def affected_lines
    if disruptions_information = []
      lines_affected =  (route_information.select{|x| x["lines"]})["lines"].map{|x| x["name"]}
    end
    else
    end
  end


  binding.pry
end