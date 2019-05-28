class Excuse < ActiveRecord::Base
  belongs_to :users
  belongs_to :undergrounds

url_base = "https://api.tfl.gov.uk"
app_id = "d4a1a955"
app_key = "752dfb87ef1e3702402c660cecf36992"


#find ids from inside the station_id table using the user inputted data
origin_id = 1000266
destination_id = 1000013

all_disruptions_call = "#{url_base}/Line/Mode/tube/Disruption?app_key=#{app_key}&app_id=#{app_id}"
#disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]
disruption_type = "#{url_base}/Line/Meta/DisruptionCategories?app_key=#{app_key}&app_id=#{app_id}"
route = "#{url_base}/journey/journeyresults/#{origin_id}/to/#{destination_id}"


disruptions_information = RestClient.get(all_disruptions_call)
route_information = JSON.parse(RestClient.get(route))

lines_affected =  (route_information.select{|x| x["lines"]})["lines"].map{|x| x["name"]}

# line_names = lines_affected["lines"].map{|x| x["name"]}
all_stops_call = "#{url_base}/StopPoint/Type/NaptanMetroStation?app_key=#{app_key}&app_id=#{app_id}"
all_stops = JSON.parse(RestClient.get(all_stops_call))

all_underground_stops = all_stops.select { |x| x["commonName"].include?("Underground Station") }
all_underground_children = all_underground_stops.map { |station| station["children"]}




binding.pry



end