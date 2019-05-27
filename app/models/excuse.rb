class Excuse < ActiveRecord::Base
  belongs_to :users
  belongs_to :undergrounds
end

const app_id = d4a1a955
const app_key = 752dfb87ef1e3702402c660cecf36992

#all disruptions
all_disruptions_call = "https://api.tfl.gov.uk/Line/Mode/tube/Disruption?app_key=752dfb87ef1e3702402c660cecf36992&app_id=d4a1a955"

#disruption type
disruptions = ["Undefined","RealTime","PlannedWork","Information","Event","Crowding","StatusAlert"]

#disruption type api call
# https://api.tfl.gov.uk/Line/Meta/DisruptionCategories?app_key=752dfb87ef1e3702402c660cecf36992&app_id=d4a1a955

