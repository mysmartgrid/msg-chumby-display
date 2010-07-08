require 'rubygems'
require 'flukso'
if __FILE__ == $0
  require File.join(File.dirname(__FILE__), 'reading-cache.rb');
end

module MSG_Chumby
  BASE_URL="https://api.mysmartgrid.de/sensor"
  # Generates random readings for standalone demos.
  class RandomReadingImporter
    def initialize(reading_cache, max_reading)
      @reading_cache=reading_cache
      @max_reading=max_reading
    end
    def doWork
      value=rand(@max_reading)
      reading=Flukso::UTCReading.new(Time.now.to_i, value)
      #puts "generated random reading #{reading}"
      @reading_cache.update_last_reading(reading);
    end
  end
  class LastMinuteImporter
    def initialize(reading_cache, location, local_id)
      @reading_cache=reading_cache
      @query=FluksoLocal::Query.new(location)
      @local_id=local_id
    end
    def doWork
      begin
        values=@query.getReadings(@local_id);
        # handle last value
        last_value=values.max
        #puts "Last reading: timestamp = #{last_value[0]}, value=#{last_value[1]}"
        reading=Flukso::UTCReading.new(last_value[0], last_value[1])
        @reading_cache.update_last_reading(reading);
        # now handle last minute
        last_minute=Array.new();
        values.each{|current|
          currentreading=Flukso::UTCReading.new(current[0], current[1])
          last_minute << currentreading
        }
        last_minute.sort! {|a, b|
          a.utc_timestamp <=> b.utc_timestamp
        }
        @reading_cache.update_last_minute(last_minute);
      rescue StandardError => bam
        puts "Cannot retrieve last minute: #{bam}"
      end
    end
  end
  class LastHourImporter
    def initialize(reading_cache, sensor_id, token)
      @reading_cache=reading_cache
      auth=Flukso::TokenAuth.new(token);
      @api=Flukso::API.new(auth, BASE_URL);
      @query=Flukso::QueryReadings.new(sensor_id, :hour, :watt)
    end
    def doWork
      begin
        readings=@query.execute(@api);
      rescue Exception => e
        puts "Query failed: #{e}"
        puts "Used #{BASE_URL} as BASE_URL"
        exit(-10);
      end
      #puts "Got Response:"
      #readings.each{|reading|
      #  puts reading
      #}
      @reading_cache.update_last_hour(readings);
    end
  end
  class LastDayImporter
    def initialize(reading_cache, sensor_id, token)
      @reading_cache=reading_cache
      auth=Flukso::TokenAuth.new(token);
      @api=Flukso::API.new(auth, BASE_URL);
      @query=Flukso::QueryReadings.new(sensor_id, :day, :watt)
    end
    def doWork
      begin
        readings=@query.execute(@api);
      rescue Exception => e
        puts "Query failed: #{e}"
        puts "Used #{BASE_URL} as BASE_URL"
        exit(-10);
      end
      #puts "Got Response:"
      #readings.each{|reading|
      #  puts reading
      #}
      @reading_cache.update_last_day(readings);
    end
  end


end

if __FILE__ == $0
  reading_cache=MSG_Chumby::Reading_Cache.new();
  demo_importer=MSG_Chumby::DemoReadingImporter.new(reading_cache, 400);
  demo_importer.doWork();
end
