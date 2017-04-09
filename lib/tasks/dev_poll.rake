namespace :dev_poll do
  task :fetch_pollution_ents => :environment do
    puts "Fetch pollution enterprise of Shanghai"
    response = RestClient.get "http://pollution.api.juhe.cn/jhapi/pollution/distribution", :params => {:key => JUHE_CONFIG["poll_api_key"], :city => "310000" }
    data = JSON.parse(response.body)

    data["result"].each do |e|
      existing_pull_ent = PollutionEnt.find_by_ent_code( e["ent_code"] )
      if existing_pull_ent.nil?
        PollutionEnt.create!(:ent_code => e["EntCode"], :ent_name => e["EntName"], :lon => e["Lon"], :lat => e["Lat"],
                              :gas_st_nums => e["GasStnums"], :water_st_nums => e["WaterStnums"])
      end
    end

    puts "Total: #{PollutionEnt.count} pollution enterprises."
  end
end
