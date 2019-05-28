class Excuse < ActiveRecord::Base
  belongs_to :users
  belongs_to :undergrounds

url_base = "https://api.tfl.gov.uk"
app_id = "d4a1a955"
app_key = "752dfb87ef1e3702402c660cecf36992"

origin_id = 1000266
destination_id = 1000013

all_disruptions_call = "#{url_base}/Line/Mode/tube/Disruption?app_key=#{app_key}&app_id=#{app_id}"
#disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]
disruption_type = "#{url_base}/Line/Meta/DisruptionCategories?app_key=#{app_key}&app_id=#{app_id}"
route = "#{url_base}/journey/journeyresults/#{origin_id}/to/#{destination_id}"


res = RestClient.get(all_disruptions_call)
binding.pry



end