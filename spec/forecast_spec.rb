require 'spec_helper'
describe WeatherWeasel::Forecast do
  before(:all) do
  @test_data =  [{"date"=>{"epoch"=>"1362722400", "pretty"=>"10:00 PM PST on March 07, 2013", "day"=>7, "month"=>3, "year"=>2013, "yday"=>65, "hour"=>22, "min"=>"00", "sec"=>0, "isdst"=>"0", "monthname"=>"March", "weekday_short"=>"Thu", "weekday"=>"Thursday", "ampm"=>"PM", "tz_short"=>"PST", "tz_long"=>"America/Los_Angeles"}, "period"=>1, "high"=>{"fahrenheit"=>"55", "celsius"=>"13"}, "low"=>{"fahrenheit"=>"37", "celsius"=>"3"}, "conditions"=>"Rain Showers", "icon"=>"rain", "icon_url"=>"http://icons-ak.wxug.com/i/c/k/rain.gif", "skyicon"=>"partlycloudy", "pop"=>40, "qpf_allday"=>{"in"=>0.07, "mm"=>1.8}, "qpf_day"=>{"in"=>0.04, "mm"=>1.0}, "qpf_night"=>{"in"=>0.0, "mm"=>0.0}, "snow_allday"=>{"in"=>0, "cm"=>0}, "snow_day"=>{"in"=>0, "cm"=>0}, "snow_night"=>{"in"=>0, "cm"=>0}, "maxwind"=>{"mph"=>9, "kph"=>14, "dir"=>"South", "degrees"=>172}, "avewind"=>{"mph"=>7, "kph"=>11, "dir"=>"WNW", "degrees"=>294}, "avehumidity"=>70, "maxhumidity"=>90, "minhumidity"=>59}, {"date"=>{"epoch"=>"1362808800", "pretty"=>"10:00 PM PST on March 08, 2013", "day"=>8, "month"=>3, "year"=>2013, "yday"=>66, "hour"=>22, "min"=>"00", "sec"=>0, "isdst"=>"0", "monthname"=>"March", "weekday_short"=>"Fri", "weekday"=>"Friday", "ampm"=>"PM", "tz_short"=>"PST", "tz_long"=>"America/Los_Angeles"}, "period"=>2, "high"=>{"fahrenheit"=>"57", "celsius"=>"14"}, "low"=>{"fahrenheit"=>"37", "celsius"=>"3"}, "conditions"=>"Partly Cloudy", "icon"=>"partlycloudy", "icon_url"=>"http://icons-ak.wxug.com/i/c/k/partlycloudy.gif", "skyicon"=>"partlycloudy", "pop"=>10, "qpf_allday"=>{"in"=>0.0, "mm"=>0.0}, "qpf_day"=>{"in"=>0.0, "mm"=>0.0}, "qpf_night"=>{"in"=>0.0, "mm"=>0.0}, "snow_allday"=>{"in"=>0, "cm"=>0}, "snow_day"=>{"in"=>0, "cm"=>0}, "snow_night"=>{"in"=>0, "cm"=>0}, "maxwind"=>{"mph"=>9, "kph"=>14, "dir"=>"NW", "degrees"=>312}, "avewind"=>{"mph"=>7, "kph"=>11, "dir"=>"NW", "degrees"=>306}, "avehumidity"=>68, "maxhumidity"=>82, "minhumidity"=>48}, {"date"=>{"epoch"=>"1362895200", "pretty"=>"10:00 PM PST on March 09, 2013", "day"=>9, "month"=>3, "year"=>2013, "yday"=>67, "hour"=>22, "min"=>"00", "sec"=>0, "isdst"=>"0", "monthname"=>"March", "weekday_short"=>"Sat", "weekday"=>"Saturday", "ampm"=>"PM", "tz_short"=>"PST", "tz_long"=>"America/Los_Angeles"}, "period"=>3, "high"=>{"fahrenheit"=>"55", "celsius"=>"13"}, "low"=>{"fahrenheit"=>"45", "celsius"=>"7"}, "conditions"=>"Partly Cloudy", "icon"=>"partlycloudy", "icon_url"=>"http://icons-ak.wxug.com/i/c/k/partlycloudy.gif", "skyicon"=>"mostlysunny", "pop"=>0, "qpf_allday"=>{"in"=>0.0, "mm"=>0.0}, "qpf_day"=>{"in"=>0.0, "mm"=>0.0}, "qpf_night"=>{"in"=>0.0, "mm"=>0.0}, "snow_allday"=>{"in"=>0, "cm"=>0}, "snow_day"=>{"in"=>0, "cm"=>0}, "snow_night"=>{"in"=>0, "cm"=>0}, "maxwind"=>{"mph"=>9, "kph"=>14, "dir"=>"NNW", "degrees"=>329}, "avewind"=>{"mph"=>4, "kph"=>6, "dir"=>"NW", "degrees"=>320}, "avehumidity"=>51, "maxhumidity"=>76, "minhumidity"=>46}, {"date"=>{"epoch"=>"1362981600", "pretty"=>"11:00 PM PDT on March 10, 2013", "day"=>10, "month"=>3, "year"=>2013, "yday"=>68, "hour"=>23, "min"=>"00", "sec"=>0, "isdst"=>"1", "monthname"=>"March", "weekday_short"=>"Sun", "weekday"=>"Sunday", "ampm"=>"PM", "tz_short"=>"PDT", "tz_long"=>"America/Los_Angeles"}, "period"=>4, "high"=>{"fahrenheit"=>"57", "celsius"=>"14"}, "low"=>{"fahrenheit"=>"39", "celsius"=>"4"}, "conditions"=>"Chance of Rain", "icon"=>"chancerain", "icon_url"=>"http://icons-ak.wxug.com/i/c/k/chancerain.gif", "skyicon"=>"cloudy", "pop"=>40, "qpf_allday"=>{"in"=>0.21, "mm"=>5.3}, "qpf_day"=>{"in"=>0.12, "mm"=>3.0}, "qpf_night"=>{"in"=>0.12, "mm"=>3.0}, "snow_allday"=>{"in"=>0, "cm"=>0}, "snow_day"=>{"in"=>0, "cm"=>0}, "snow_night"=>{"in"=>0, "cm"=>0}, "maxwind"=>{"mph"=>4, "kph"=>6, "dir"=>"SSE", "degrees"=>167}, "avewind"=>{"mph"=>3, "kph"=>5, "dir"=>"South", "degrees"=>176}, "avehumidity"=>71, "maxhumidity"=>76, "minhumidity"=>55}] 
  end
  
  it "can return the highest temperature in its forecast days in fahrenheit" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.high("imperial").should == "57"
  end
  
  it "can return the highest temperature in its forecast days in celsius" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.high("metric").should == "14"
  end
  
  it "can return the lowest temperature in its forecast days in fahrenheit" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.low("imperial").should == "37"
  end
  
  it "can return the lowest temperature in its forecast days in celsius" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.low("metric").should == "3"
  end
  
  it "can return the an array of highs in its forecast days" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.all_highs("imperial").should == ["55", "57", "55", "57"]
  end
  
  it "can return the an array of lows in its forecast days" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.stub(:forecast_days).and_return(@test_data)
    portland.all_lows("imperial").should == ["37", "37", "45", "39"]
  end
  
  it "can return fahrenheit when passed imperial" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.set_scale("imperial") == "fahrenheit"
  end
  
  it "can return celsius when passed metric" do
    portland= WeatherWeasel::Forecast.new("Portland", "OR", "test")
    portland.set_scale("metric") == "celsius"
  end
  
end