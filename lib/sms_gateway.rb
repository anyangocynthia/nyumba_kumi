require 'json'
class SMSGateway

  def initialize
      @login = ENV['SMS_GATEWAY_LOGIN']
      @password = ENV['SMS_GATEWAY_PASSWORD']
      @base_uri = ENV['SMS_GATEWAY_URL']
      # @max_segment = 160 #ENV['SMS_MAX_SEGMENT_LENGTH'].to_i
      # @split = false #ENV['SPLIT_SMS']
    end

    def add_pluses msg
      msg = msg.gsub(" ", "+")
    end

    def send to, message
      begin
        response = HTTParty.get("#{@base_uri}?target=kenyaOrient&msisdn=#{to}&text=#{add_pluses(message)}&login=#{@login}&pass=#{@password}")
        puts ">>>>>> #{response}"
      rescue Exception => e
        puts e.backtrace
      end
    end
end