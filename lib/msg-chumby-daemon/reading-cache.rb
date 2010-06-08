require 'flukso'

module MSG_Chumby
  class Reading_Cache
    def initialize
      @last_reading=nil;
      @last_reading_mutex=Mutex.new();
      @last_hour=nil;
      @last_hour_mutex=Mutex.new();
      @last_day=nil;
      @last_day_mutex=Mutex.new();
    end
    def update_last_reading(reading)
      raise "Please provide a UTCReading instance" if reading.class != Flukso::UTCReading
      @last_reading_mutex.synchronize do
        @last_reading=reading
      end
    end
    def last_reading
      retval=nil
      @last_reading_mutex.synchronize do
        retval=@last_reading
      end
      return retval
    end
    def update_last_hour(readings)
      raise "Please provide an Array instance" if readings.class != Array
      @last_hour_mutex.synchronize do
        @last_hour=readings
      end
    end
    def last_hour
      retval=nil
      @last_hour_mutex.synchronize do
        retval=@last_hour
      end
      return retval
    end
    def update_last_day(readings)
      raise "Please provide an Array instance" if readings.class != Array
      @last_day_mutex.synchronize do
        @last_day=readings
      end
    end
    def last_day
      retval=nil
      @last_day_mutex.synchronize do
        retval=@last_day
      end
      return retval
    end


  end
end
