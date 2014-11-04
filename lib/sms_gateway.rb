require 'json'
class SMSGateway

  def initialize
      @user = ENV['SMS_GATEWAY_USER']
      @password = ENV['SMS_GATEWAY_PASSWORD']
      @url = ENV['SMS_GATEWAY_URL']
      @shortcode = ENV['SMS_SHORTCODE']
      @campaign_id = ENV['SMS_CAMPAIGN_ID']
      @channel = ENV['SMS_CHANNEL']
    end

    def add_pluses msg
      msg = msg.gsub(" ", "+")
    end

    def send to, message
      if !Rails.env.production?
        `curl -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" -d "username=#{@user}&password=#{@password}&MSISDN=#{to}&content=#{message}&channel=#{@channel}&shortcode=#{@shortcode}&campaignid=#{@campaign_id}&premium=1" #{@url}`
      else
        puts "<>>>>>> TARGET: INFO\nMSISDN: #{to}\nTEXT: #{message}"
      end
     # password = Digest::MD5.hexdigest(to + @password)
     # begin
     #  # puts "#{@base_uri}?target=info&msisdn=#{to}&text=#{add_pluses(message)}&login=#{@login}&pass=#{password}"
     #  if Rails.env.production?
     #   response = HTTParty.get("#{@base_uri}?target=info&msisdn=#{to}&text=#{add_pluses(message)}&login=#{@login}&pass=#{password}")
     #   puts ">>>>>> #{response}"
     #  else
     #    puts "<>>>>>> TARGET: INFO\nMSISDN: #{to}\nTEXT: #{message}"
     #  end
     # rescue Exception => e
     #   puts e.backtrace
     # end
    end
end