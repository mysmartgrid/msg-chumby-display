require 'rubygems'
require 'xmlsimple'
require 'mongrel'

module MSG_Chumby
  $counter=0;

  class TimeHandler < Mongrel::HttpHandler
    def process(request, response)
      response.start(200) do |head,out|
      #  puts "Request for time received."
        head["Content-Type"] = "text/xml"
        current_time={'time' => [ Time.now.strftime("%H:%M:%S")], 'counter' => [$counter]}
        out.write(XmlSimple.xml_out( current_time,{'RootName' => "current_time"}));
        $counter+=1
      end
    end
  end

  class ResetHandler < Mongrel::HttpHandler
    def process(request, response)
      response.start(200) do |head,out|
        puts "Received Reset Request."
        puts "Params: #{request.params}"
        puts "Body: #{request.body}"
        head["Content-Type"] = "text/xml"
        $counter=0
        current_time={'time' => [ Time.now.to_i ], 'counter' => [$counter]}
        out.write(XmlSimple.xml_out( current_time,{'RootName' => "current_time"}));
      end
    end
  end

  class LastReadingHandler < Mongrel::HttpHandler
    def initialize(reading_cache)
      @reading_cache=reading_cache;
    end
    def process(request, response)
      response.start(200) do |head,out|
        head["Content-Type"] = "text/xml"
        reading=(@reading_cache.last_reading())  
        reading = Flukso::UTCReading.new(Time.now.to_i, 0.0) if reading==nil;
        time=Time.at(reading.utc_timestamp);
        current_reading=
          {'time' => [ time.strftime("%H:%M:%S")], 'reading' => [reading.value]};
        out.write(XmlSimple.xml_out( current_reading,{'RootName' => "current_reading"}));
      end
    end
  end


  class HTTP_XML_Server
    def initialize(host, port, reading_cache)
      @server = Mongrel::HttpServer.new(host, port)
      @server.register("/time", TimeHandler.new)
      @server.register("/reset", ResetHandler.new)
      @server.register("/last_reading", LastReadingHandler.new(reading_cache))
    end
    def start
      @threads=@server.run
    end
    def join
      @threads.join();
    end
    def stop
      @server.stop
    end
  end

end
