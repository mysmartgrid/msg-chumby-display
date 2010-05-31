require 'flukso'

module MSG_Chumby
  class Reading_Cache
    def initialize
      @last_reading=nil;
      @last_reading_mutex=Mutex.new();
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
  end
end
