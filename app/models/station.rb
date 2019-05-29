class Station < ActiveRecord::Base
  has_many :excuses

  url_base = "https://api.tfl.gov.uk"
  app_id = "d4a1a955"
  app_key = "752dfb87ef1e3702402c660cecf36992"

  stops_call = "#{url_base}/StopPoint/Type/NaptanMetroStation?app_key=#{app_key}&app_id=#{app_id}"
  stops = JSON.parse(RestClient.get(stops_call))

  station_stops = stops.select { |x| x["commonName"].include?("Underground Station") }
  station_children = station_stops.map { |station| station["children"][0]}
  station_id_strings = station_children.map {|station| "#{station["icsCode"]} --- #{station["commonName"]}"}
  station_id_pairs = station_id_strings.map {|station| station.split(" --- ") }

  def populate(station_ids)
    station_ids.each { |station| Station.create("icsCode":"#{station[0].to_i}", "commonName":"#{station[1]}")}
  end



end