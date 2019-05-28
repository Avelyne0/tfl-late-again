class Underground < ActiveRecord::Base
  has_many :excuses
  
  url_base = "https://api.tfl.gov.uk"
  app_id = "d4a1a955"
  app_key = "752dfb87ef1e3702402c660cecf36992"

  stops_call = "#{url_base}/StopPoint/Type/NaptanMetroStation?app_key=#{app_key}&app_id=#{app_id}"
  stops = JSON.parse(RestClient.get(stops_call))

  underground_stops = stops.select { |x| x["commonName"].include?("Underground Station") }
  underground_children = underground_stops.map { |station| station["children"][0]}
  underground_id_strings = underground_children.map {|station| "#{station["icsCode"]} --- #{station["commonName"]}"}
  underground_id_pairs = underground_id_strings.map {|station| station.split(" --- ") }

  def populate(underground_ids)
    underground_ids.each { |station| Underground.create("icsCode":"#{station[0].to_i}", "commonName":"#{station[1]}")}
  end



end