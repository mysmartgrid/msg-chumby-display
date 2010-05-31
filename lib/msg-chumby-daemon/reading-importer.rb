require 'rubygems'
require 'flukso'
if __FILE__ == $0
  require File.join(File.dirname(__FILE__), 'reading-cache.rb');
end

module MSG_Chumby
  class DemoReadingImporter
    def initialize(reading_cache, max_reading)
      @reading_cache=reading_cache
      @max_reading=max_reading
    end
    def doWork
        loop do
          value=rand(@max_reading)
          reading=Flukso::UTCReading.new(Time.now.to_i, value)
          #puts "generated random reading #{reading}"
          @reading_cache.update_last_reading(reading);
          sleep(3);
        end
    end
  end
end

if __FILE__ == $0
  reading_cache=MSG_Chumby::Reading_Cache.new();
  demo_importer=MSG_Chumby::DemoReadingImporter.new(reading_cache, 400);
  demo_importer.doWork();
end
