require 'bunny' 

module Publishers
  class Application
    def initialize(routing_key:, exchange_name:, message:)
      @message = message
      @exchange_name = exchange_name
      @routing_key = routing_key
    end

    def perform 
      connection.start
      channel = connection.create_channel
      second_exchange = channel.direct(@exchange_name)
      second_exchange.publish(@message.to_json, routing_key: @routing_key)
      connection.close
    end

    private

    def connection_options
      {
        host: "localhost",
        port: "5672",
        vhost: "/",
        username: "guest",
        password: "guest"
      }
    end 

    def connection
      @connection ||=
      Bunny.new(connection_options)
    end
  end
end