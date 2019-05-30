class User < ActiveRecord::Base
  has_many :excuses
  def find_disrupted_lines
    @disruptions = "#{URL_BASE}/Line/Mode/tube/Disruption#{APP_KEY}"
    @disruptions_information = JSON.parse(RestClient.get(@disruptions))
    @disrupted_lines = @disruptions_information.map { |disruption| disruption['description'].split(":").first}
  end

  def find_route(origin_icsCode, destination_icsCode)
    @route = "#{URL_BASE}/journey/journeyresults/#{origin_icsCode}/to/#{destination_icsCode}#{APP_KEY}"
    @route_information = JSON.parse(RestClient.get(@route))
    @route_lines =
      (
      @route_information.select { |information| information['lines'] }
    )['lines'].map { |lines| lines['name'] }
  end

  def affected_lines_array(origin_id, destination_id)
    find_route(origin_id, destination_id)
    find_disrupted_lines
    if @disrupted_lines == []
      @affected_lines_array = @route_lines
    elsif (@route_lines & @disrupted_lines) != []
      @affected_lines_array = (@route_lines & @disrupted_lines)
    else
      @affected_lines_array = @disrupted_lines
    end
  end

  def affected_line
    @affected_line = @affected_lines_array.sample
  end
end
