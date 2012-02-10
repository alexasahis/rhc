module Rhc
  module Rest
    class Cartridge
      include Rest
      attr_reader :type, :name
      def initialize(args)
        @name = args[:name] || args["name"]
        @type = args[:type] || args["type"]
        @links = args[:links] || args["links"]
      end

      def start
        url = @@end_point + @links['START']['href']
        method =  @links['START']['method']
        payload = {:event=> "start"}
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        begin
          response = request.execute
          return parse_response(response)
        rescue RestClient::ExceptionWithResponse => e
          puts e.response
        end
      end

      def stop()
        url = @@end_point + @links['STOP']['href']
        method =  @links['STOP']['method']
        payload = {:event=> "stop"}
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        begin
          response = request.execute
          return parse_response(response)
        rescue RestClient::ExceptionWithResponse => e
          puts e.response
        end
      end

      def restart
        url = @@end_point + @links['RESTART']['href']
        method =  @links['RESTART']['method']
        payload = {:event=> "restart"}
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        begin
          response = request.execute

          return parse_response(response)
        rescue RestClient::ExceptionWithResponse => e
          puts e.response
        end
      end

      def reload
        url = @@end_point + @links['RESTART']['href']
        method =  @links['RESTART']['method']
        payload = {:event=> "reload"}
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers, :payload => payload)
        begin
          response = request.execute

          return parse_response(response)
        rescue RestClient::ExceptionWithResponse => e
          puts e.response
        end
      end

      def destroy
        url = @@end_point + @links['DELETE']['href']
        method =  @links['DELETE']['method']
        request = RestClient::Request.new(:url => url, :method => method, :headers => @@headers)
        begin
          request.execute
        rescue RestClient::ExceptionWithResponse => e
          puts e.response
        end
      end
      alias :delete :destroy
      alias :delete :destroy
    end
  end
end
