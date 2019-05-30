class Station < ActiveRecord::Base
  belongs_to :users

  url_base = "https://api.tfl.gov.uk"
  app_id = "d4a1a955"
  app_key = "752dfb87ef1e3702402c660cecf36992"

  stops_call = "#{url_base}/StopPoint/Type/NaptanMetroStation?app_key=#{app_key}&app_id=#{app_id}"
  @@stops = JSON.parse(RestClient.get(stops_call))

  def self.populate
    station_stops = @@stops.select { |x| x["commonName"].include?("Underground Station") }
    station_children = station_stops.map { |station| station["children"][0]}
    station_id_strings = station_children.map {|station| "#{station["icsCode"]} --- #{station["commonName"]}"}
    station_id_pairs = station_id_strings.map {|station| station.split(" --- ") }
    station_id_pairs.each { |station| Station.create("icsCode":"#{station[0].to_i}", "commonName":"#{station[1]}")}
  end

  def self.find_by_commonName(name)
    station = Station.where("commonName like ?", "%#{name}%").first
  end

  def self.find_by_iscCode(code)
    station = Station.where("icsCode like ?", "%#{code}%").first
  end
end



