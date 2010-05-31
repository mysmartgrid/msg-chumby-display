require 'flukso'

module MSG_Chumby
  class DemoReadingImporter
    def initialize(reading_cache, max_reading)
      @reading_cache=reading_cache
      @max_reading=max_reading
    end
    def start
      @thread=Thread.new do
        run();
      end
    end
    def stop
      @thread.stop
    end
    def join
      @thread.join
    end
    def run
      loop do
        generate_value();
        sleep(3);
      end
    end
    def generate_value
      value=rand(max_reading)
      reading=UTCReading.new(Time.now, value)
      @reading_cache.update_last_reading(reading);
    end
  end
end
